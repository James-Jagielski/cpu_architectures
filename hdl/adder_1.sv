`default_nettype none
`timescale 1ns/1ps

// A 1 bit full adder that we can daisy chain to make a larger ripple carry adder.

module adder_1(a, b, c_in, sum, c_out);

input wire a, b, c_in;
output logic sum, c_out;

// Figure 5.3 from the text:
always_comb begin : adder_gates
  c_out = a&b | a&c_in | b&c_in;
  sum = c_in ^ a ^ b;
end
endmodule
