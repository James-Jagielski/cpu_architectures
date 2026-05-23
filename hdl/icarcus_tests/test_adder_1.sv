module test_adder_1;

logic a, b, c_in;
logic sum, c_out;

logic exp_sum;
logic exp_cout;

adder_1 UUT (
  .a(a),
  .b(b),
  .c_in(c_in),
  .sum(sum),
  .c_out(c_out)
);

int errors = 0;

initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0, test_adder_1);

  for (int i = 0; i < 8; i = i + 1) begin
    c_in = i[2];
    b    = i[1];
    a    = i[0];

    #1;

    exp_sum  = a ^ b ^ c_in;
    exp_cout = (a & b) | (a & c_in) | (b & c_in);

    if ({c_out, sum} !== {exp_cout, exp_sum}) begin
      $display("FAIL: %b%b%b expected %b%b got %b%b",
        a, b, c_in,
        exp_cout, exp_sum,
        c_out, sum
      );
      errors = errors + 1;
    end
  end

  if (errors == 0)
    $display("PASS");
  else
    $display("FAIL %0d errors", errors);

  $finish;
end

endmodule