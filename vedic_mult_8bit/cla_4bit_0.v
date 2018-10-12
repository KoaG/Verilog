module cla_4bit_0 (
	input [3:0]a,b,
	output [3:0]s,
	output cout
	);

wire G0,G1,G2,G3;
//Carry Generation
assign G0 = a[0] & b[0];
assign G1 = a[1] & b[1];
assign G2 = a[2] & b[2];
assign G3 = a[3] & b[3];

wire P0,P1,P2,P3;
//Carry Propagation
assign P0 = a[0] ^ b[0];
assign P1 = a[1] ^ b[1];
assign P2 = a[2] ^ b[2];
assign P3 = a[3] ^ b[3];

wire C0,C1,C2;
//Carry Assignment
assign C0 = G0;
assign C1 = G1 | (G0 & P1);
assign C2 = G2 | (G1 & P2) | (G0 & P2 & P1);
assign cout = G3 | (G2 & P3) | (G1 & P3 & P2) | (G0 & P3 & P2 & P1);

//Sum Assignment
assign s[0] = P0;
assign s[1] = P1 ^ C0;
assign s[2] = P2 ^ C1;
assign s[3] = P3 ^ C2;

endmodule 