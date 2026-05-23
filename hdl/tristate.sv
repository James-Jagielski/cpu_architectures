`default_nettype none
`timescale 1ns/1ps

module tristate(in, oe, io);
parameter N = 1;
input wire [N-1:0] in;
input wire oe;
// Note, using wire and assign because xilinx doesn't support always_comb for tristates.
inout wire [N-1:0] io;

assign io = oe ? in : 'Z;

endmodule