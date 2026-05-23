`default_nettype none
`timescale 1ns/1ps

module rv32i_single_cycle_core(
  input  wire clk,
  input  wire rst,
  input  wire ena,

  output logic [31:0] mem_addr,
  input  wire  [31:0] mem_rd_data,
  output logic [31:0] mem_wr_data,
  output logic        mem_wr_ena,

  output logic        addr_valid,
  input  wire         addr_ready,
  output logic        data_ready,
  input  wire         data_valid,

  output logic [31:0] PC
);

`include "rv32_common.sv"
`include "alu_types.sv"

// ============================================================
// PC REGISTER
// ============================================================

logic [31:0] PC_next;

always_ff @(posedge clk or posedge rst) begin
  if (rst)
    PC <= PC_START_ADDRESS;
  else if (ena)
    PC <= PC_next;
end

// ============================================================
// INSTRUCTION FETCH
// ============================================================

logic [31:0] IR;
assign IR = mem_rd_data;

// ============================================================
// DECODE
// ============================================================

logic [6:0] op;
logic [4:0] rd, rs1, rs2;
logic [2:0] funct3;
logic [6:0] funct7;

always_comb begin
  op     = IR[6:0];
  rd     = IR[11:7];
  rs1    = IR[19:15];
  rs2    = IR[24:20];
  funct3 = IR[14:12];
  funct7 = IR[31:25];
end

// ============================================================
// REGISTER FILE
// ============================================================

logic [31:0] reg_A, reg_B;
logic        reg_write;
logic [31:0] wb_data;

register_file RF(
  .clk(clk),
  .rst(rst),
  .wr_ena(reg_write),
  .wr_addr(rd),
  .wr_data(wb_data),
  .rd_addr0(rs1),
  .rd_addr1(rs2),
  .rd_data0(reg_A),
  .rd_data1(reg_B)
);

// ============================================================
// IMM GENERATION
// ============================================================

logic [31:0] imm;

always_comb begin
  case(op)
    OP_ITYPE, OP_LTYPE, OP_JALR:
      imm = {{20{IR[31]}}, IR[31:20]};

    OP_STYPE:
      imm = {{20{IR[31]}}, IR[31:25], IR[11:7]};

    OP_BTYPE:
      imm = {{19{IR[31]}}, IR[31], IR[7], IR[30:25], IR[11:8], 1'b0};

    OP_JAL:
      imm = {{12{IR[31]}}, IR[19:12], IR[20], IR[30:21], 1'b0};

    OP_LUI, OP_AUIPC:
      imm = {IR[31:12], 12'b0};

    default:
      imm = 32'b0;
  endcase
end

// ============================================================
// ALU
// ============================================================

alu_control_t alu_control;
logic [31:0] alu_a, alu_b;
logic [31:0] alu_result;
logic zero, equal, overflow;

always_comb begin
  case(op)
    OP_RTYPE: begin
      case(funct3)
        FUNCT3_ADD:  alu_control = funct7[5] ? ALU_SUB : ALU_ADD;
        FUNCT3_XOR:  alu_control = ALU_XOR;
        FUNCT3_OR:   alu_control = ALU_OR;
        FUNCT3_AND:  alu_control = ALU_AND;
        FUNCT3_SLL:  alu_control = ALU_SLL;
        FUNCT3_SRL:  alu_control = funct7[5] ? ALU_SRA : ALU_SRL;
        FUNCT3_SLT:  alu_control = ALU_SLT;
        FUNCT3_SLTU: alu_control = ALU_SLTU;
      endcase
    end

    OP_ITYPE: begin
      case(funct3)
        3'b000: alu_control = ALU_ADD;
        3'b100: alu_control = ALU_XOR;
        3'b110: alu_control = ALU_OR;
        3'b111: alu_control = ALU_AND;
        3'b001: alu_control = ALU_SLL;
        3'b101: alu_control = funct7[5] ? ALU_SRA : ALU_SRL;
        3'b010: alu_control = ALU_SLT;
        3'b011: alu_control = ALU_SLTU;
      endcase
    end

    default:
      alu_control = ALU_ADD;
  endcase
end

assign alu_a = reg_A;
assign alu_b = (op == OP_ITYPE || op == OP_LTYPE || op == OP_STYPE)
              ? imm
              : reg_B;

alu ALU(
  .a(alu_a),
  .b(alu_b),
  .control(alu_control),
  .result(alu_result),
  .zero(zero),
  .equal(equal),
  .overflow(overflow)
);

// ============================================================
// MEMORY
// ============================================================

assign mem_addr = alu_result;

always_comb begin
  case(funct3)
    3'b000: mem_wr_data = {4{reg_B[7:0]}};
    3'b001: mem_wr_data = {2{reg_B[15:0]}};
    default: mem_wr_data = reg_B;
  endcase
end

assign mem_wr_ena = (op == OP_STYPE);

// ============================================================
// LOAD DATA
// ============================================================

logic [31:0] load_data;

always_comb begin
  case(funct3)
    3'b000: load_data = {{24{mem_rd_data[7]}},  mem_rd_data[7:0]};
    3'b001: load_data = {{16{mem_rd_data[15]}}, mem_rd_data[15:0]};
    3'b010: load_data = mem_rd_data;
    3'b100: load_data = {24'b0, mem_rd_data[7:0]};
    3'b101: load_data = {16'b0, mem_rd_data[15:0]};
    default: load_data = mem_rd_data;
  endcase
end

// ============================================================
// WRITEBACK
// ============================================================

always_comb begin
  case(op)
    OP_LTYPE:  wb_data = load_data;
    OP_LUI:    wb_data = imm;
    OP_AUIPC:  wb_data = PC + imm;
    OP_JAL:    wb_data = PC + 4;
    OP_JALR:   wb_data = PC + 4;
    default:   wb_data = alu_result;
  endcase
end

assign reg_write = (op != OP_STYPE && op != OP_BRANCH);

// ============================================================
// BRANCH + PC
// ============================================================

logic branch_taken;

always_comb begin
  case(funct3)
    FUNCT3_BEQ:  branch_taken = equal;
    FUNCT3_BNE:  branch_taken = ~equal;
    FUNCT3_BLT:  branch_taken = ($signed(reg_A) < $signed(reg_B));
    FUNCT3_BGE:  branch_taken = ($signed(reg_A) >= $signed(reg_B));
    FUNCT3_BLTU: branch_taken = (reg_A < reg_B);
    FUNCT3_BGEU: branch_taken = (reg_A >= reg_B);
    default:     branch_taken = 1'b0;
  endcase
end

always_comb begin
  case(op)
    OP_BRANCH:
      PC_next = branch_taken ? PC + imm : PC + 4;

    OP_JAL:
      PC_next = PC + imm;

    OP_JALR:
      PC_next = (reg_A + imm) & ~32'b1;

    default:
      PC_next = PC + 4;
  endcase
end

endmodule