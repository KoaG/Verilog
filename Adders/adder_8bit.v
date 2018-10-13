module adder_8bit (
	input [7:0]a,b,
	output cout,
	output [7:0]s
	);

cla_4bit_0 cla0(.a(a[3:0]),.b(b[3:0]),.s(s[3:0]),.cout(c0));
csa_4bit csa0(.a(a[7:4]),.b(b[7:4]),.cin(c0),.s(s[7:4]),.cout(cout));

endmodule 