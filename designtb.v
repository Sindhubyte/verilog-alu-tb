`timescale 1ns/1ps

module ALU_tb;
  reg [3:0] A, B;
  reg [2:0] sel;
  wire [3:0] out;
  wire carry, zero;

  ALU uut (
    .A(A),
    .B(B),
    .sel(sel),
    .out(out),
    .carry(carry),
    .zero(zero)
  );

  initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, ALU_tb);

    A = 4'b0101; // 5
    B = 4'b0011; // 3

    sel = 3'b000; #10; $display("ADD : out=%b, carry=%b, zero=%b", out, carry, zero);  // 5 + 3 = 8
    sel = 3'b001; #10; $display("SUB : out=%b, carry=%b, zero=%b", out, carry, zero);  // 5 - 3 = 2
    sel = 3'b010; #10; $display("AND : out=%b, zero=%b", out, zero);                   // 0101 & 0011 = 0001
    sel = 3'b011; #10; $display("OR  : out=%b, zero=%b", out, zero);                   // 0101 | 0011 = 0111
    sel = 3'b100; #10; $display("XOR : out=%b, zero=%b", out, zero);                   // 0101 ^ 0011 = 0110
    sel = 3'b101; #10; $display("NOT : out=%b, zero=%b", out, zero);                   // ~0101 = 1010
    sel = 3'b110; #10; $display("SHL : out=%b, zero=%b", out, zero);                   // 0101 << 1 = 1010
    sel = 3'b111; #10; $display("SHR : out=%b, zero=%b", out, zero);                   // 0101 >> 1 = 0010

    $finish;
  end
endmodule
