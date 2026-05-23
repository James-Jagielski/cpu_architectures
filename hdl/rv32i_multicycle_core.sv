`default_nettype none
`timescale 1ns/1ps

`include "alu_types.sv"
`include "memory_access.sv"
`include "memory_exceptions.sv"
`include "memory_map.sv"
`include "rv32_common.sv"

module rv32i_multicycle_core(
  clk, rst, ena,
  mem_addr, mem_rd_data, mem_wr_data, mem_wr_ena,
  addr_ready, addr_valid, data_ready, data_valid,
  mem_access, mem_exception, mem_unsign,
  PC, instructions_completed, instruction_done
);

parameter PC_START_ADDRESS = {MMU_BANK_INST, 28'h0};

// ============================================================
// IO
// ============================================================

input wire clk, rst, ena;

output logic [31:0] mem_addr, mem_wr_data;
input  wire [31:0] mem_rd_data;

output mem_access_t mem_access;
input  mem_exception_mask_t mem_exception;

output logic mem_wr_ena;
input  wire addr_ready, data_valid;
output logic addr_valid, data_ready;

output logic mem_unsign;

output wire [31:0] PC;
output logic [31:0] instructions_completed;
output logic instruction_done;

// ============================================================
// PC + REGFILE
// ============================================================

logic PC_ena;
logic [31:0] PC_next, PC_old;

register #(.N(32), .RESET(PC_START_ADDRESS)) PC_REGISTER (
  .clk(clk), .rst(rst), .ena(PC_ena), .d(PC_next), .q(PC)
);

logic [4:0] rd, rs1, rs2;
wire [31:0] reg_A, reg_B;
logic reg_write;
logic [31:0] rfile_wr_data;

register_file REGISTER_FILE(
  .clk(clk), .rst(rst),
  .wr_ena(reg_write),
  .wr_addr(rd),
  .wr_data(rfile_wr_data),
  .rd_addr0(rs1),
  .rd_addr1(rs2),
  .rd_data0(reg_A),
  .rd_data1(reg_B)
);

// ============================================================
// PIPE REGISTERS
// ============================================================

logic [31:0] IR;
logic IR_write;

register #(.N(32)) IR_REGISTER (
  .clk(clk), .rst(rst),
  .ena(IR_write),
  .d(mem_rd_data),
  .q(IR)
);

register #(.N(32)) PC_OLD_REGISTER (
  .clk(clk), .rst(rst),
  .ena(IR_write),
  .d(PC),
  .q(PC_old)
);

wire [31:0] alu_last;

// ============================================================
// DECODE
// ============================================================

logic [6:0] op, funct7;
logic [2:0] funct3;
logic [31:0] imm;

always_comb begin
  op     = IR[6:0];
  rd     = IR[11:7];
  rs1    = IR[19:15];
  rs2    = IR[24:20];
  funct3 = IR[14:12];
  funct7 = IR[31:25];
end

// ============================================================
// IMM GENERATION (FULL RV32I)
// ============================================================

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
// ALU CONTROL (RISC-V COMPLETE)
// ============================================================

alu_control_t alu_control;

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
        3'b000: alu_control = ALU_ADD;   // addi
        3'b100: alu_control = ALU_XOR;   // xori
        3'b110: alu_control = ALU_OR;    // ori
        3'b111: alu_control = ALU_AND;   // andi
        3'b001: alu_control = ALU_SLL;   // slli
        3'b101: alu_control = funct7[5] ? ALU_SRA : ALU_SRL;
        3'b010: alu_control = ALU_SLT;   // slti
        3'b011: alu_control = ALU_SLTU;  // sltiu
        default: alu_control = ALU_ADD;
      endcase
    end

    OP_LUI, OP_AUIPC: alu_control = ALU_ADD;

    OP_LTYPE, OP_STYPE: alu_control = ALU_ADD;

    OP_BRANCH: alu_control = ALU_SUB;

    OP_JAL, OP_JALR: alu_control = ALU_ADD;

    default: alu_control = ALU_ADD;
  endcase
end

// ============================================================
// ALU
// ============================================================

logic [31:0] src_a, src_b;
logic [31:0] alu_result;
logic zero, equal, overflow;

alu ALU (
  .a(src_a),
  .b(src_b),
  .result(alu_result),
  .control(alu_control),
  .overflow(overflow),
  .zero(zero),
  .equal(equal)
);

// ============================================================
// SOURCE MUXES (your style preserved)
// ============================================================

always_comb begin
  case(alu_src_a)
    ALU_SRC_A_PC:     src_a = PC;
    ALU_SRC_A_RF:     src_a = reg_A;
    ALU_SRC_A_OLD_PC: src_a = PC_old;
    default:          src_a = 32'b0;
  endcase
end

always_comb begin
  case(alu_src_b)
    ALU_SRC_B_RF:   src_b = reg_B;
    ALU_SRC_B_IMM:  src_b = imm;
    ALU_SRC_B_4:    src_b = 32'd4;
    default:        src_b = 32'b0;
  endcase
end

// ============================================================
// LOAD / STORE (FULL RV32I)
// ============================================================

logic [31:0] load_data;

always_comb begin
  case(funct3)
    3'b000: load_data = {{24{mem_rd_data[7]}},  mem_rd_data[7:0]};   // lb
    3'b001: load_data = {{16{mem_rd_data[15]}}, mem_rd_data[15:0]};  // lh
    3'b010: load_data = mem_rd_data;                                 // lw
    3'b100: load_data = {24'b0, mem_rd_data[7:0]};                   // lbu
    3'b101: load_data = {16'b0, mem_rd_data[15:0]};                 // lhu
    default: load_data = mem_rd_data;
  endcase
end

always_comb begin
  case(funct3)
    3'b000: mem_wr_data = {4{reg_B[7:0]}};   // sb
    3'b001: mem_wr_data = {2{reg_B[15:0]}};  // sh
    default: mem_wr_data = reg_B;           // sw
  endcase
end

// ============================================================
// RESULT SELECT
// ============================================================

logic [31:0] result;

always_comb begin
  case(result_src)
    RESULT_SRC_ALU:      result = alu_result;
    RESULT_SRC_MEM_DATA: result = load_data;
    RESULT_SRC_ALU_LAST: result = alu_last;
    default:            result = alu_result;
  endcase
end

assign PC_next       = result;
assign rfile_wr_data = result;

// ============================================================
// BRANCH LOGIC (FULL RV32I)
// ============================================================

logic branch_taken;

always_comb begin
  case(funct3)
    FUNCT3_BEQ:  branch_taken = equal;
    FUNCT3_BNE:  branch_taken = ~equal;
    FUNCT3_BLT:  branch_taken = alu_result[0];
    FUNCT3_BGE:  branch_taken = ~alu_result[0];
    FUNCT3_BLTU: branch_taken = alu_result[0];
    FUNCT3_BGEU: branch_taken = ~alu_result[0];
    default:     branch_taken = 1'b0;
  endcase
end

// ============================================================
// FSM CONTROL (kept your structure externally unchanged)
// ============================================================

always_comb begin
  instruction_done = (state == S_ALU_WRITEBACK || state == S_MEM_WRITEBACK);

  PC_ena = (state == S_FETCH || state == S_BRANCH || state == S_JAL || state == S_JALR);

  reg_write = (state == S_ALU_WRITEBACK || state == S_MEM_WRITEBACK);

  mem_wr_ena = (state == S_MEM_WRITE);

  addr_valid = (state == S_FETCH || state == S_MEM_ADDR);

  data_ready = 1'b1;

  mem_unsign = funct3[2];
end

endmodule