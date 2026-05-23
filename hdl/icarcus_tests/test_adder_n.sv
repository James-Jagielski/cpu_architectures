// iverilog -g2012 -o output/adder_n.out hdl/adder_1.sv hdl/adder_n.sv hdl/icarcus_tests/test_adder_n.sv
module test_adder_n;

parameter N = 8;

logic [N-1:0] a, b;
logic c_in;
logic [N-1:0] sum;
logic c_out;

logic [N:0] expected;
int errors = 0;

adder_n #(N) UUT (
  .a(a),
  .b(b),
  .c_in(c_in),
  .sum(sum),
  .c_out(c_out)
);

initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0, test_adder_n);

  $display("Testing %0d-bit adder_n", N);

  for (int i = 0; i < (1 << N); i = i + 1) begin
    for (int j = 0; j < (1 << N); j = j + 1) begin
      for (int k = 0; k < 2; k = k + 1) begin

        a = i;
        b = j;
        c_in = k;

        #1;

        expected = a + b + c_in;

        if ({c_out, sum} !== expected) begin
          $display("FAIL: a=%0d b=%0d cin=%0d exp=%b got=%b%b",
            a, b, c_in,
            expected,
            c_out, sum
          );
          errors = errors + 1;
        end

      end
    end
  end

  if (errors == 0)
    $display("PASS");
  else
    $display("FAIL %0d errors", errors);

  $finish;
end

endmodule