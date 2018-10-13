module bcd2xs3
(input [3:0]i,
output v,[3:0]x);

assign  x[3] = i[3]|(i[2]&i[0])|(i[2]&i[1]),
		x[2] = i[2]~^(~i[1]&~i[0]),
		x[1] = i[1]~^i[0],
		x[0] = ~i[0],
		v = (~i[3])|(~i[2]&~i[1]);

endmodule 