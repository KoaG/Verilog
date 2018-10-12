module adder_16bit (
	input [15:0]a,b,
	output cout,[15:0]sum
);

assign {cout,sum} = a + b;

endmodule 