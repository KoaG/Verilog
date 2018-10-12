module csa_10bit (
	input [9:0]a,b,
	output cout,
	output [9:0]s
	);

adder_2bit add2(
	.a(a[1:0]),
	.b(b[1:0]),
	.sum(s[1:0]),
	.cout(csel0)
	);

csa_4bit csa0(
	.a(a[5:2]),
	.b(b[5:2]),
	.cin(csel0),
	.s(s[5:2]),
	.cout(csel1)
	);

csa_4bit csa1(
	.a(a[9:6]),
	.b(b[9:6]),
	.cin(csel1),
	.s(s[9:6]),
	.cout(cout)
	);

endmodule 