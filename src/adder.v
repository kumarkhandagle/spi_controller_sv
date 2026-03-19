`timescale 1ns/1ps

module ha(
    input  a,
    input  b,
    output sum,
    output cout
);

assign sum = a ^ b;   // XOR for sum
assign cout = a & b;  // AND for carry

endmodule