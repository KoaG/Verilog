module adder_2bit (
	input [1:0]a,b,
	output [1:0]sum,
	output cout
	);

wire w1;

xor xor1(sum[0],a[0],b[0]);
and and1(w1,a[0],b[0]);

xor xor2(w2,a[1],b[1]);
and and2(w3,a[1],b[1]);
and and3(w4,w1,w2);

xor xor3(sum[1],w2,w1);
or or1(cout,w3,w4);

endmodule 