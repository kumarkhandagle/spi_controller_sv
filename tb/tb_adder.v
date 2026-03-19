`timescale 1ns/1ps

module tb_ha;

  reg a, b;
  wire sum, cout;
  integer errors;

  // Instantiate the half-adder
  ha dut (
    .a(a),
    .b(b),
    .sum(sum),
    .cout(cout)
  );

  initial begin
    errors = 0;

    // Test case 1: a=0, b=0
    a = 0; b = 0; #1;
    if (sum !== (a ^ b) || cout !== (a & b)) errors = errors + 1;

    // Test case 2: a=0, b=1
    a = 0; b = 1; #1;
    if (sum !== (a ^ b) || cout !== (a & b)) errors = errors + 1;

    // Test case 3: a=1, b=0
    a = 1; b = 0; #1;
    if (sum !== (a ^ b) || cout !== (a & b)) errors = errors + 1;

    // Test case 4: a=1, b=1
    a = 1; b = 1; #1;
    if (sum !== (a ^ b) || cout !== (a & b)) errors = errors + 1;

    // Summary
    if (errors == 0) begin
      $display("ALL TESTS PASSED");
      $finish;
    end else begin
      $display("ERROR: = %0d", errors);
      $fatal; // returns non-zero exit code for CI
    end
  end

endmodule