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

// Standard control signals.
input  wire clk, rst, ena; // <- worry about implementing the ena signal last.
output logic instruction_done; // Should be high for one clock cycle when finishing an instruction (e.g. during the writeback state).

// Memory interface.
output logic [31:0] mem_addr, mem_wr_data;

input   wire [31:0] mem_rd_data;
output mem_access_t mem_access;
input mem_exception_mask_t mem_exception;
output logic mem_wr_ena;
input wire addr_ready, data_valid;
output logic addr_valid, data_ready;
output logic mem_unsign;

// Program Counter
output wire [31:0] PC;
output logic [31:0] instructions_completed; // TODO(student) - increment this by one whenever an instruction is complete.
wire [31:0] PC_old;
logic PC_ena, PC_old_ena;
logic [31:0] PC_next;

// Control Signals
// Decoder
logic [6:0] op;
logic [2:0] funct3;
logic [6:0] funct7;
logic rtype, itype, ltype, stype, btype, jtype;
logic [31:0] extended_immediate;

// R-file Control Signals
logic [4:0] rd, rs1, rs2;
wire [31:0] reg_data1, reg_data2;
logic reg_write;
logic [31:0] rfile_wr_data;
wire [31:0] reg_A, reg_B;

// ALU Control Signals
enum logic [1:0] {ALU_SRC_A_PC, ALU_SRC_A_RF, ALU_SRC_A_OLD_PC, ALU_SRC_A_ZERO} 
  alu_src_a;
enum logic [1:0] {ALU_SRC_B_RF, ALU_SRC_B_IMM, ALU_SRC_B_4, ALU_SRC_B_ZERO} 
  alu_src_b;
logic [31:0] src_a, src_b;
wire [31:0] alu_result;
alu_control_t alu_control, ri_alu_control;
wire overflow;
wire zero;
wire equal;

// Non-architectural Register Signals
logic IR_write;
wire [31:0] IR; // Instruction Register (current instruction)
logic ALU_ena;
wire [31:0] alu_last; // Not a descriptive name, but this is what it's called in the text.
logic mem_data_ena;
wire [31:0] mem_data;
enum logic {MEM_SRC_PC, MEM_SRC_RESULT} mem_src;
enum logic [1:0] {RESULT_SRC_ALU, RESULT_SRC_MEM_DATA, RESULT_SRC_ALU_LAST} result_src; 
logic [31:0] result;

// Program Counter Register
register #(.N(32), .RESET(PC_START_ADDRESS)) PC_REGISTER (
  .clk(clk), .rst(rst), .ena(PC_ena), .d(PC_next), .q(PC)
);

// Register file
register_file REGISTER_FILE(
  .clk(clk), .rst(rst),
  .wr_ena(reg_write), .wr_addr(rd), .wr_data(rfile_wr_data),
  .rd_addr0(rs1), .rd_addr1(rs2),
  .rd_data0(reg_data1), .rd_data1(reg_data2)
);

`ifdef SIMULATION
task print_rfile();
  REGISTER_FILE.print_state();
endtask
`endif

// Non-architecture register: save register read data for future cycles.
register #(.N(32)) REGISTER_A (.clk(clk), .rst(rst), .ena(1'b1), .d(reg_data1), .q(reg_A));
register #(.N(32)) REGISTER_B (.clk(clk), .rst(rst), .ena(1'b1), .d(reg_data2), .q(reg_B));
always_comb mem_wr_data = reg_B; // RISC-V always stores data from this location.

// ALU and related control signals
// Feel free to replace with your ALU from the homework.
alu ALU (
  .a(src_a), .b(src_b), .result(alu_result),
  .control(alu_control),
  .overflow(overflow), .zero(zero), .equal(equal)
);

// Mux to pick the correct a inputs to the ALU. 
always_comb begin : ALU_MUX_A
  case (alu_src_a)
    ALU_SRC_A_PC     : src_a = PC;
    ALU_SRC_A_RF     : src_a = reg_A;
    ALU_SRC_A_OLD_PC : src_a = PC_old;
    ALU_SRC_A_ZERO   : src_a = 32'd0;
  endcase 
end

always_comb begin : ALU_MUX_B
  case (alu_src_b)
    ALU_SRC_B_RF   : src_b = reg_B;
    ALU_SRC_B_IMM  : src_b = extended_immediate;
    ALU_SRC_B_4    : src_b = 32'd4;
    ALU_SRC_B_ZERO : src_b = 32'd0;
  endcase
end

// Use funct3 to compute the alu control code for R and I types. 
always_comb begin : ALU_CONTROL_DECODING
  case(funct3)
    FUNCT3_ADD : begin
      if(rtype & funct7[5]) ri_alu_control = ALU_SUB;
      else ri_alu_control = ALU_ADD;
    end
    FUNCT3_SLL : ri_alu_control = ALU_SLL;
    FUNCT3_SLT : ri_alu_control = ALU_SLT;
    FUNCT3_SLTU : ri_alu_control = ALU_SLTU;
    FUNCT3_XOR : ri_alu_control = ALU_XOR;
    FUNCT3_SHIFT_RIGHT : begin
      if(funct7[5]) ri_alu_control = ALU_SRA;
      else ri_alu_control = ALU_SRL;
    end
    FUNCT3_OR : ri_alu_control = ALU_OR;
    FUNCT3_AND : ri_alu_control = ALU_AND;
  endcase
end

// Non-architectural Register: IR
// Stores the current instruction once it's ready from memory.
register #(.N(32)) IR_REGISTER (
  .clk(clk), .rst(rst), .ena(IR_write), .d(mem_rd_data), .q(IR)
);

// Non-architectural Register: IR
// Stores the original PC (useful for branches).
register #(.N(32)) PC_OLD_REGISTER(
  .clk(clk), .rst(rst), .ena(IR_write), .d(PC), .q(PC_old)
);


// Non-architectural Register: ALU Result
// Stores the ALU result for future clock cycles.
register #(.N(32)) ALU_REGISTER(
  .clk(clk), .rst(rst), .ena(1'b1 /* was ALU_ena, TODO(avinash) see if this works */), .d(alu_result), .q(alu_last)
);

// Non-architectural Register: Memory Data
// Stores what was read from memory for future clock cycles.
register #(.N(32)) MEM_DATA_REGISTER(
  .clk(clk), .rst(rst), .ena(mem_data_ena), .d(mem_rd_data), .q(mem_data)
);

// Memory Address Mux
always_comb begin : MEM_ADDR_MUX
  case(mem_src)
    MEM_SRC_PC : mem_addr = PC;
    MEM_SRC_RESULT: mem_addr = result;
  endcase
end

// Result Muxing
always_comb begin: RESULT_MUX
  case(result_src)
    RESULT_SRC_ALU: result = alu_result;
    RESULT_SRC_MEM_DATA: result = mem_data;
    RESULT_SRC_ALU_LAST: result = alu_last;
    default: result = alu_result;
  endcase
end
always_comb begin : RESULT_ALIASES // Worth having separate names for debugging.
  PC_next = result;
  rfile_wr_data = result;
end

// Instruction Decoding
logic [11:0] imm12_stype;
always_comb begin : instruction_decoder
  // Pull apart instruction
  op = IR[6:0];
  rd = IR[11:7];
  rs1 = IR[19:15];
  rs2 = IR[24:20];
  funct3 = IR[14:12];
  funct7 = IR[31:25];
  // Immediate decoding
  imm12_stype = {IR[31:25], IR[11:7]};
  // See Figure 6.27 in the text for why the immediate bit packing is so convoluted.
  case(op)
    OP_ITYPE, OP_JALR, OP_LTYPE : begin
      if(funct3 == FUNCT3_SHIFT_RIGHT | funct3 == FUNCT3_SLL) begin
        extended_immediate = {27'b0, IR[24:20]};
      end else begin
        extended_immediate = {{20{IR[31]}}, IR[31:20]}; 
      end
    end
    OP_STYPE : extended_immediate = {{20{imm12_stype[11]}}, imm12_stype};
    OP_BTYPE : extended_immediate = {{20{IR[31]}}, IR[7],IR[30:25], IR[11:8], 1'b0};
    OP_JAL   : extended_immediate = {{12{IR[31]}}, IR[19:12], IR[20], IR[30:21], 1'b0};
    OP_AUIPC, OP_LUI : extended_immediate = {IR[31:12], 12'b0};
    default: extended_immediate = 0;
  endcase
end

// Multicycle FSM.
enum logic [3:0] {
  // Cycle 1: Get the current instruction, store in IR.
  S_FETCH = 0,
  // Cycle 2: Decode the instruction.
  S_DECODE = 1, 
  // Cycle 3: Varies based on op code.
  S_MEM_ADDR = 2, S_EXECUTE_R = 3, S_EXECUTE_I = 4, S_EXECUTE_U = 5,
  S_JAL =6 , S_JALR = 7, S_BRANCH = 8,
  // Cycle 4: Varies based on op code.
  S_ALU_WRITEBACK = 9, S_MEM_READ = 10, S_MEM_WRITE = 11, S_JUMP_WRITEBACK = 12,
  // Cycle 5: For load instructions.
  S_MEM_WRITEBACK = 13,
  S_MEM_WAIT = 14,
  S_ERROR = 4'hF
} pending_state, state;

always_ff @(posedge clk) begin : MULTICYCLE_FSM
  if(rst) begin
    state <= S_FETCH;
    pending_state <= S_ERROR;
    instructions_completed <= 0;
  end
  else if (ena) begin
    case(state)
      S_FETCH: begin
        if(data_valid) begin
          state <= S_DECODE;
        end else begin
          pending_state <= S_DECODE;
          state <= S_MEM_WAIT;
        end
      end
      S_MEM_WAIT: begin
        if(data_valid) begin
          state <= pending_state;
          pending_state <= S_ERROR;
        end
      end
      S_DECODE: begin
`ifdef SIMULATION 
`ifdef VERBOSE
        $display("@%t: PC = 0x%h, IR = 0x%h, decoded op: %s", $time, PC, IR, op_name(op));
`endif // VERBOSE
`endif // SIMULATION
        case(op)
          OP_RTYPE: state <= S_EXECUTE_R;
          OP_ITYPE: state <= S_EXECUTE_I;
          OP_STYPE, OP_LTYPE: begin
            //state <= S_MEM_ADDR;
            if(addr_ready) begin
              state <= S_MEM_ADDR;
            end else begin
              state <= S_MEM_WAIT;
              pending_state <= S_MEM_ADDR;
            end
          end
          OP_JAL: state <= S_JAL;
          OP_JALR: state <= S_JALR;
          OP_BTYPE: state <= S_BRANCH;
          OP_AUIPC, OP_LUI : state <= S_EXECUTE_U;
          default: begin
            $display("Error: op %b not implemented yet", op);
            state <= S_ERROR;
          end
        endcase
      end
      S_MEM_ADDR: begin
        if(data_valid) begin
          case(op)
            OP_LTYPE: state <= S_MEM_READ;
            OP_STYPE: state <= S_MEM_WRITE;
            default: state <= S_ERROR; 
          endcase
        end
      end
      S_EXECUTE_R, S_EXECUTE_I, S_EXECUTE_U: begin
        state <= S_ALU_WRITEBACK;
      end
      S_JAL: begin
        state <= S_JUMP_WRITEBACK;
      end
      S_JALR: begin
        state <= S_JUMP_WRITEBACK;
      end
      S_JUMP_WRITEBACK, S_BRANCH, S_ALU_WRITEBACK, S_MEM_WRITEBACK: begin
        instructions_completed <= instructions_completed + 1;
        state <= S_FETCH;
      end
      S_MEM_WRITE: begin
        if(addr_ready) begin
          instructions_completed <= instructions_completed + 1;
          state <= S_FETCH;
        end
      end
      S_MEM_READ: begin
        if(data_valid) begin
          state <= S_MEM_WRITEBACK;
        end
      end
      default: begin
        state <= S_ERROR;
      end
    endcase
  end
end


always_comb begin
  if(rst | ~ena) begin
    instruction_done = 0;
  end else begin
    case(state)
      S_JUMP_WRITEBACK, S_BRANCH, S_ALU_WRITEBACK, S_MEM_WRITEBACK, S_MEM_WRITE: instruction_done = 1'b1;
      default: instruction_done = 1'b0;
    endcase
  end
end

logic branch_taken;
always_comb begin : PC_and_IR_control_unit
  IR_write = (state == S_FETCH & data_valid) | 
             (state == S_MEM_WAIT & pending_state == S_DECODE & data_valid);
  // This is the readable version, you can do it far more elegantly by muxing equal and alu_result[0] intelligently using the funct3 bits.
  
  case(funct3)
    FUNCT3_BEQ: branch_taken = equal;
    FUNCT3_BNE: branch_taken = ~equal;
    FUNCT3_BLT, FUNCT3_BLTU: branch_taken = alu_result[0];
    FUNCT3_BGE, FUNCT3_BGEU: branch_taken = ~alu_result[0];
    default: branch_taken = 0;
  endcase
  
  case(state)
    S_FETCH, S_JAL, S_JALR: PC_ena = 1;
    S_BRANCH: PC_ena = branch_taken;
    default : PC_ena = 0;
  endcase
end


always_comb begin : memory_control_unit
  case(state)
    S_FETCH: mem_access = MEM_ACCESS_WORD;
    default: mem_access = mem_access_t'(funct3[1:0]);
  endcase

  case(state)
    default: mem_unsign = 0;
    S_MEM_ADDR, S_MEM_READ, S_MEM_WRITEBACK: mem_unsign = funct3[2];
  endcase

  
  // mem_wr_ena = state == S_MEM_WRITE;
  mem_wr_ena = ~rst & (state == S_MEM_ADDR) & (op == OP_STYPE);
  
  case(state)
    S_MEM_ADDR, S_MEM_READ, S_MEM_WRITE: mem_src = MEM_SRC_RESULT;
    default: mem_src = MEM_SRC_PC;
  endcase

  // Latch result from memory when it is ready.
  case(state)
    S_MEM_READ, S_MEM_WRITE: mem_data_ena = data_valid;
    default: mem_data_ena = 1'b0;
  endcase

  case(state)
    S_FETCH, S_MEM_ADDR: addr_valid = 1'b1 & ~rst;
    default: addr_valid = 0;
  endcase
  case(state)
    // data ready should be high on any cycle that uses the results of mem_rd_data.
    S_FETCH, S_DECODE, S_MEM_ADDR, S_MEM_READ, S_MEM_WRITE: data_ready = 1;
    default: data_ready = 0;
  endcase
end

always_comb begin : register_file_control_unit
  case(state)
    S_ALU_WRITEBACK, S_MEM_WRITEBACK, S_JUMP_WRITEBACK : reg_write = 1;
    default reg_write = 0;
  endcase

  case(state)
    S_ALU_WRITEBACK, S_MEM_READ, S_MEM_WRITE, S_BRANCH: 
      result_src = RESULT_SRC_ALU_LAST;
    S_MEM_WRITEBACK: result_src = RESULT_SRC_MEM_DATA;
    default: result_src = RESULT_SRC_ALU;
  endcase
end

localparam ALU_DEFAULT = ALU_ADD;

always_comb begin : alu_control_unit
  case(state)
    S_FETCH: begin
      alu_src_a = ALU_SRC_A_PC;
      alu_src_b = ALU_SRC_B_4;
      ALU_ena = 0;
      alu_control = ALU_ADD;
    end
    S_DECODE: begin
      alu_src_a = ALU_SRC_A_OLD_PC;
      alu_src_b = ALU_SRC_B_IMM;
      ALU_ena = 1;
      alu_control = ALU_ADD;
    end
    S_EXECUTE_R: begin
      alu_src_a = ALU_SRC_A_RF;
      alu_src_b = ALU_SRC_B_RF;
      ALU_ena = 1;
      alu_control = ri_alu_control;
    end
    S_EXECUTE_I: begin
      alu_src_a = ALU_SRC_A_RF;
      alu_src_b = ALU_SRC_B_IMM;
      ALU_ena = 1;
      alu_control = ri_alu_control;
    end
    S_EXECUTE_U: begin
      if(op == OP_AUIPC)
        alu_src_a = ALU_SRC_A_PC;
      else
        alu_src_a = ALU_SRC_A_ZERO;
      alu_src_b = ALU_SRC_B_IMM;
      ALU_ena = 1;
      alu_control = ri_alu_control;
    end
    S_ALU_WRITEBACK: begin
      alu_src_a = ALU_SRC_A_RF;
      alu_src_b = ALU_SRC_B_RF;
      ALU_ena = 0;
      alu_control = alu_control_t'(ALU_DEFAULT);
    end
    S_MEM_ADDR: begin
      alu_src_a = ALU_SRC_A_RF;
      alu_src_b = ALU_SRC_B_IMM;
      ALU_ena = 1;
      alu_control = ALU_ADD;
    end
    S_MEM_READ: begin
      alu_src_a = ALU_SRC_A_RF;
      alu_src_b = ALU_SRC_B_IMM;
      ALU_ena = 0;
      alu_control = alu_control_t'(ALU_DEFAULT);
    end
    S_MEM_WRITE: begin
      alu_src_a = ALU_SRC_A_RF;
      alu_src_b = ALU_SRC_B_IMM;
      ALU_ena = 0;
      alu_control = alu_control_t'(ALU_DEFAULT);
    end
    S_MEM_WRITEBACK: begin
      alu_src_a = ALU_SRC_A_RF;
      alu_src_b = ALU_SRC_B_IMM;
      ALU_ena = 1;
      alu_control = alu_control_t'(ALU_DEFAULT);
    end
    S_BRANCH: begin
      alu_src_a = ALU_SRC_A_RF;
      alu_src_b = ALU_SRC_B_RF;
      ALU_ena = 1;
      if(funct3[1]) alu_control = ALU_SLTU;
      else alu_control = ALU_SLT;
    end
    S_JAL: begin
      alu_src_a = ALU_SRC_A_OLD_PC;
      alu_src_b = ALU_SRC_B_IMM;
      ALU_ena = 0;
      alu_control = ALU_ADD;
    end
    S_JALR: begin
      alu_src_a = ALU_SRC_A_RF;
      alu_src_b = ALU_SRC_B_IMM;
      ALU_ena = 0;
      alu_control = ALU_ADD;
    end
    S_JUMP_WRITEBACK : begin
      alu_src_a = ALU_SRC_A_OLD_PC;
      alu_src_b = ALU_SRC_B_4;
      ALU_ena = 0;
      alu_control = ALU_ADD;
    end
    default: begin
      alu_src_a = ALU_SRC_A_RF;
      alu_src_b = ALU_SRC_B_RF;
      ALU_ena = 0;
      alu_control = alu_control_t'(ALU_DEFAULT);
    end
  endcase
end

endmodule