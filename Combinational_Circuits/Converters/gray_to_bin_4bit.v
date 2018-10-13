module gray_to_bin_4bit
(input [3:0]G,
output [3:0]B);

wire [3:0]I;

assign I[3] = G[3],
	I[2] = I[3]^G[2],
	I[1] = I[2]^G[1],
	I[0] = I[1]^G[0];
assign B = I;
endmodule 