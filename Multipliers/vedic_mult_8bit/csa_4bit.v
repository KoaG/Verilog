module csa_4bit (
	input cin,[3:0]a,b,
	output [3:0]s,
	output cout
	);

wire [3:0]s0,s1;
wire c0,c1;

cla_4bit_0 cla0(
	.a(a),
	.b(b),
	.s(s0),
	.cout(c0)
	);

cla_4bit_1 cla1(
	.a(a),
	.b(b),
	.s(s1),
	.cout(c1)
	);

assign {cout,s} = (cin) ? {c1,s1} : {c0,s0};

endmodule 