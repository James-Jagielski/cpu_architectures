`default_nettype none
`timescale 1ns/1ps

module pwm(clk, rst, ena, step, duty, out);

parameter N = 8;

input wire clk, rst;
input wire ena; // Enables the output.
input wire step; // Enables the internal counter. You should only increment when this signal is high (this is how we slow down the PWM to reasonable speeds).
input wire [N-1:0] duty; // The "duty cycle" input.
output logic out;

`define BEHAVIORAL_SOLUTION
//`define STRUCTURAL_SOLUTION


`ifdef STRUCTURAL_SOLUTION

wire [N-1:0] counter, next_counter;
wire comparator;

comparator_lt #(.N(N)) COMPARATOR (.a(counter), .b(duty), .out(comparator));
adder_n #(.N(N)) ADDER (
  .a(counter), .b(1), .c_in(1'b0), .c_out(), .sum(next_counter)
);
register #(.N(N)) COUNTER_REGISTER (
  .clk(clk), .rst(rst), .ena(step), .d(next_counter), .q(counter)
);

always_comb begin
  // Trick to have the output be fully high at maximum duty cycle.
  out = ena & ( comparator | &counter );
end

`endif // STRUCTURAL_SOLUTION

`ifdef BEHAVIORAL_SOLUTION
logic [N-1:0] counter;
logic comparator;

always_comb begin
  comparator = counter < duty;
  // Trick to have the output be fully high at maximum duty cycle.
  out = ena & ( comparator | &counter );
end

always_ff @(posedge clk) begin
  if(rst) begin
    counter <=0;
  end
  else if (step) begin
    counter <= counter + 1;
  end
end
`endif // BEHAVIORAL_SOLUTION

endmodule