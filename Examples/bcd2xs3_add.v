module bcd2xs3_add
(input [3:0]i,
output v,[3:0]x);

wire w1,w2;
four_bit_adder fba1(.a(i),.b(4'b0011),.cin(1'b0),.s(x),.cout(w1));

or or1(w2, i[2], i[1]);
nand nand1(v, i[3], w2);

endmodule 