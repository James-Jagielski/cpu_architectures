`default_nettype none
`timescale 1ns/1ps

`include "alu_types.sv"

module alu(a, b, control, result, overflow, zero, equal);

parameter N = 32;

input  wire signed [N-1:0] a, b;
input  alu_control_t control;

output logic signed [N-1:0] result;
output logic zero;
output logic equal;
output logic overflow;

// ------------------------------------------------------------
// Boolean unit
// ------------------------------------------------------------
logic [N-1:0] a_and_b, a_or_b, a_xor_b, b_inverted;

always_comb begin : basic_gates
  a_and_b   = a & b;
  a_or_b    = a | b;
  a_xor_b   = a ^ b;
  b_inverted = ~b;
end

// ------------------------------------------------------------
// Adder / subtractor
// ------------------------------------------------------------
logic [N-1:0] alu_b;
logic alu_c_in;

always_comb begin : alu_muxing
  alu_b   = control[2] ? b_inverted : b;
  alu_c_in = control[2];
end

wire alu_c_out;
wire [N-1:0] alu_result;

adder_n #(.N(N)) ADDER (
  .a(a),
  .b(alu_b),
  .c_in(alu_c_in),
  .c_out(alu_c_out),
  .sum(alu_result)
);

// ------------------------------------------------------------
// Comparator
// ------------------------------------------------------------
comparator_eq #(.N(N)) EQUAL (
  .a(a),
  .b(b),
  .out(equal)
);

// SLT signals (cleaned up)
logic a_slt_b, a_sltu_b;
logic [N-1:0] less_than;

// ------------------------------------------------------------
// Overflow logic (cleaned, same behavior)
// ------------------------------------------------------------
logic same_signs;
logic overflow_possible;

always_comb begin
  same_signs = ~(a[N-1] ^ b[N-1]);

  overflow_possible =
      (control[2] & ~same_signs) |   // subtraction case
      (~control[2] & same_signs);    // addition case

  overflow =
      control[3] &
      (a[N-1] ^ alu_result[N-1]) &
      overflow_possible;

  a_slt_b  = alu_result[N-1] ^ overflow;
  a_sltu_b = ~alu_c_out;

  less_than = '0;
  less_than[0] = control[1] ? a_sltu_b : a_slt_b;
end

// ------------------------------------------------------------
// Shifters
// ------------------------------------------------------------
wire [N-1:0] a_sll_b, a_sr_b, unzeroed_shift, zeroed_shift;
logic shamt_too_big;

always_comb begin
  shamt_too_big = |b[N-1:$clog2(N)];
end

sll #(.N(N)) SHIFT_LEFT (
  .in(a),
  .shamt(b[$clog2(N)-1:0]),
  .out(a_sll_b)
);

shift_right #(.N(N)) SHIFT_RIGHT (
  .in(a),
  .shamt(b[$clog2(N)-1:0]),
  .arithmetic(control[0]),
  .out(a_sr_b)
);

mux2 #(.N(N)) SHIFTER_MUX (
  .s(control[1]),
  .in0(a_sll_b),
  .in1(a_sr_b),
  .out(unzeroed_shift)
);

mux2 #(.N(N)) ZERO_OUT_SHIFTER_MUX (
  .s(shamt_too_big),
  .in0(unzeroed_shift),
  .in1('0),
  .out(zeroed_shift)
);

// ------------------------------------------------------------
// Boolean chain
// ------------------------------------------------------------
wire [N-1:0] a_and_xor_b, boolean_result, boolean_or_shift_result;

mux2 #(.N(N)) BOOLEAN_MUX0 (
  .s(control[1]),
  .in0(a_and_b),
  .in1(a_xor_b),
  .out(a_and_xor_b)
);

mux2 #(.N(N)) BOOLEAN_MUX1 (
  .s(control[0]),
  .in0(a_or_b),
  .in1(a_and_xor_b),
  .out(boolean_result)
);

mux2 #(.N(N)) BOOLEAN_OR_SHIFT_MUX (
  .s(control[2]),
  .in0(boolean_result),
  .in1(zeroed_shift),
  .out(boolean_or_shift_result)
);

// ------------------------------------------------------------
// Final arithmetic / compare mux
// ------------------------------------------------------------
wire [N-1:0] adder_or_comparator_result;

mux2 #(.N(N)) ADDER_OR_LT_MUX (
  .s(control[0]),
  .in0(alu_result),
  .in1(less_than),
  .out(adder_or_comparator_result)
);

// ------------------------------------------------------------
// Final result mux
// ------------------------------------------------------------
mux2 #(.N(N)) RESULT_MUX (
  .s(control[3]),
  .in0(boolean_or_shift_result),
  .in1(adder_or_comparator_result),
  .out(result)
);

// ------------------------------------------------------------
// Flags
// ------------------------------------------------------------
always_comb begin
  zero = ~(|result);
end

endmodule