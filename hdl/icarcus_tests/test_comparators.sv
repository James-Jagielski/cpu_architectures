// iverilog -g2012 -o output/comparators.out  hdl/adder_1.sv hdl/adder_n.sv hdl/comparator_eq.sv hdl/comparator_lt.sv hdl/icarcus_tests/test_comparators.sv
`timescale 1ns/1ps
`default_nettype none

module test_comparators;

parameter N = 32;

int errors = 0;

logic signed [N-1:0] a, b;
logic equals, less_than;

// DUTs
comparator_eq #(.N(N)) UUT_EQ (
  .a(a),
  .b(b),
  .out(equals)
);

comparator_lt #(.N(N)) UUT_LT (
  .a(a),
  .b(b),
  .out(less_than)
);

// Golden model (reference behavior)
logic correct_equals, correct_less_than;

task check;
begin
  correct_equals     = (a == b);
  correct_less_than  = (a < b);

  if (equals !== correct_equals) begin
    $display("EQ FAIL: a=%0d b=%0d got=%b exp=%b",
      a, b, equals, correct_equals);
    errors++;
  end

  if (less_than !== correct_less_than) begin
    $display("LT FAIL: a=%0d b=%0d got=%b exp=%b",
      a, b, less_than, correct_less_than);
    errors++;
  end
end
endtask

initial begin
  $dumpfile("comparators.vcd");
  $dumpvars(0, test_comparators);

  $display("Starting comparator tests (N=%0d)", N);

  // ------------------------------------------------------------
  // 1 Directed edge cases
  // ------------------------------------------------------------
  a = 0; b = 0; #1; check();

  a = -1; b = 1; #1; check();

  a = 1; b = -1; #1; check();

  a = 32'sh7fffffff; b = -1; #1; check();

  a = -32'sh80000000; b = 1; #1; check();

  a = 123456; b = 123456; #1; check();

  // ------------------------------------------------------------
  // 2 Boundary sweep (small local coverage)
  // ------------------------------------------------------------
  for (int i = -10; i <= 10; i++) begin
    for (int j = -10; j <= 10; j++) begin
      a = i;
      b = j;
      #1;
      check();
    end
  end

  // ------------------------------------------------------------
  // 3 Random tests
  // ------------------------------------------------------------
  for (int k = 0; k < 100; k++) begin
    a = $random;
    b = $random;
    #1;
    check();
  end

  // ------------------------------------------------------------
  // Result summary
  // ------------------------------------------------------------
  if (errors == 0)
    $display("PASS: all comparator tests passed");
  else
    $display("FAIL: %0d errors found", errors);

  $finish;
end

endmodule