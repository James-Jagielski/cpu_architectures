`default_nettype none
`timescale 1ns/1ps

module decode_error_detector(in, error);
parameter N = 4;
// localparam N_ANDS=(N-1)*(N-2);
input wire [N-1:0] in;
output logic error;

genvar i, j, k;
logic [N*N-1:0] ands;
generate
  for(i = 0; i < N; i = i + 1) begin : DECODE_ERROR_OUTER
    for (j = 0; j < N; j = j + 1) begin : DECODE_ERROR_INNER
        if (i <= j)
          always_comb ands[i*N+j] = 1'b0;
        else
          always_comb ands[i*N+j] = in[i] & in[j];
    end
  end
endgenerate

always_comb error = |ands;
endmodule