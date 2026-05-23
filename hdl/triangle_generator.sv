`default_nettype none
`timescale 1ns/1ps

// Generates "triangle" waves (counts from 0 to 2^N-1, then back down again)
// The triangle should increment/decrement only if the ena signal is high, and hold its value otherwise.
module triangle_generator(clk, rst, ena, out);

parameter N = 8;
parameter MIN=0;
parameter MAX = 2**N-1;
input wire clk, rst, ena;
output logic [N-1:0] out;

typedef enum logic {COUNTING_UP, COUNTING_DOWN} state_t;
state_t state;

always_ff @(posedge clk) begin
  if(rst) begin
    out <= MIN;
    state <= COUNTING_UP;
  end else if (ena) begin
    case(state)
      COUNTING_UP: begin        
        if(out == MAX) begin
          state <= COUNTING_DOWN;
          out <= out - 1;
        end else begin
          out <= out + 1;
        end
      end
      COUNTING_DOWN: begin
        
        if(out == MIN) begin
          state <= COUNTING_UP;
          out <= out + 1;
        end else begin
          out <= out -1;
        end
      end
    endcase
  end
end

endmodule