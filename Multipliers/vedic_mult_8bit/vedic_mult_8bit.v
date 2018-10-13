module vedic_mult_8bit (
	input [7:0]a,b,
	output [15:0]p
	);

//4-Bit Vedic Mult
wire [7:0]p0,p1,p2,p3;
vedic_mult_4bit vm1(.a(a[3:0]),.b(b[3:0]),.p(p0));
vedic_mult_4bit vm2(.a(a[3:0]),.b(b[7:4]),.p(p1));
vedic_mult_4bit vm3(.a(a[7:4]),.b(b[3:0]),.p(p2));
vedic_mult_4bit vm4(.a(a[7:4]),.b(b[7:4]),.p(p3));

//Adders and product
wire [7:0]s1,s2;
wire c1,c2,s3,c3;
wire [7:0]s4;
wire c4;
adder_8bit add81(.a(p1),.b(p2),.s(s1),.cout(c1));
adder_8bit add82(.a(s1),.b({{4{1'b0}},p0[7:4]}),.s(s2),.cout(c2));
ha ha1(.a(c1),.b(c2),.s(s3),.c(c3));
adder_8bit add83(.a(p3),.b({2'b00,c3,s3,s2[7:4]}),.s(s4),.cout(c4));

assign p[3:0] = p0[3:0];
assign p[7:4] = s2[3:0];
assign p[15:8] = s4;

endmodule 