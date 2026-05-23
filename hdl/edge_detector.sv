`default_nettype none
`timescale 1ns/1ps

module edge_detector(clk, rst, in, positive_edge, negative_edge);

input wire clk, rst, in;
output logic positive_edge, negative_edge;

parameter SYNC_DEPTH = 1;
parameter ACTIVE_LOW = 1'b0;

logic [SYNC_DEPTH:0] in_buffer;

always_ff @(posedge clk) begin
  if (rst) begin
    in_buffer <= ACTIVE_LOW ? { (SYNC_DEPTH+1){1'b1} } : '0;
  end else begin
    in_buffer[0] <= in;
    if (SYNC_DEPTH > 0) begin
      in_buffer[SYNC_DEPTH:1] <= in_buffer[SYNC_DEPTH-1:0];
    end
  end
end

always_comb begin
  if (SYNC_DEPTH > 0) begin
    positive_edge = in_buffer[SYNC_DEPTH] & ~in_buffer[SYNC_DEPTH-1];
    negative_edge = ~in_buffer[SYNC_DEPTH] & in_buffer[SYNC_DEPTH-1];
  end else begin
    positive_edge = in & ~in_buffer[0];
    negative_edge = ~in & in_buffer[0];
  end
end

endmodule