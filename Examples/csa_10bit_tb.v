module csa_10bit_tb();

reg [9:0]a,b;
wire cout;
wire [9:0]s;

csa_10bit csa1(
	.a(a),
	.b(b),
	.s(s),
	.cout(cout)
	);

initial begin
	{a,b} = 20'd0;
	repeat(2**20)
	#10 {a,b} = {a,b} + 1'b1;
end

initial
	$monitor($time," a = %d, b = %d, s = %d, cout = %b",a,b,s,cout);

endmodule 