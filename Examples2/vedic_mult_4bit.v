module vedic_mult_4bit (
	input [3:0]a,b,
	output [7:0]p
	);

//Partial Products
wire a3b0,a2b0,a1b0,a0b0;
wire a3b1,a2b1,a1b1,a0b1;
wire a3b2,a2b2,a1b2,a0b2;
wire a3b3,a2b3,a1b3,a0b3;

and and1(a0b0,a[0],b[0]);
and and2(a1b0,a[1],b[0]);
and and3(a2b0,a[2],b[0]);
and and4(a3b0,a[3],b[0]);

and and5(a0b1,a[0],b[1]);
and and6(a1b1,a[1],b[1]);
and and7(a2b1,a[2],b[1]);
and and8(a3b1,a[3],b[1]);

and and9(a0b2,a[0],b[2]);
and and10(a1b2,a[1],b[2]);
and and11(a2b2,a[2],b[2]);
and and12(a3b2,a[3],b[2]);

and and13(a0b3,a[0],b[3]);
and and14(a1b3,a[1],b[3]);
and and15(a2b3,a[2],b[3]);
and and16(a3b3,a[3],b[3]);

//Adders and product
assign p[0] = a0b0;
ha ha1 (.a(a1b0),.b(a0b1),.s(p[1]),.c(c0));	//c0 p1
add_3bits add31(.a(a2b0),.b(a1b1),.c(a0b2),.cin(c0),.s(p[2]),.c0(c1),.c1(c2));	// c2 c1 p2
add_4bits add41(.a(a3b0),.b(a2b1),.c(a1b2),.d(a0b3),.cin(c1),.s(p[3]),.c0(c3),.c1(c4));	// c4 c3 p3
add_4bits add42(.a(a3b1),.b(a2b2),.c(a1b3),.d(c2),.cin(c3),.s(p[4]),.c0(c5),.c1(c6)); // c6 c5 p4
add_3bits add32(.a(a3b2),.b(a2b3),.c(c4),.cin(c5),.s(p[5]),.c0(c7),.c1(c8));	//c8 c7 p5
fa fa1 (.a(a3b3),.b(c6),.cin(c7),.s(p[6]),.cout(c9));	//c9 p6
xor xor1(p[7],c9,c8);

endmodule 