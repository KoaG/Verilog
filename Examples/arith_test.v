module arith_test
(output [2:0]y1,y2,y3,y4,y5,y6,y7,y8,y9);
assign y1 = 3+4-7*8/10%11;
assign y2 = 5/3;
assign y3 = 5%3,
	y4 = -5/3,
	y5 = -5%3,
	y6 = 5/-3,
	y7 = 5%-3,
	y8 = -5/-3,
	y9 = -5%-3;
endmodule 