module Wallace_Mult_4bit(
	input [3:0]a,b,
	output [7:0]p
);

wire p03,p02,p01,p00;
wire p13,p12,p11,p10;
wire p23,p22,p21,p20;
wire p33,p32,p31,p30;

//partial product generation
assign {p03,p02,p01,p00} = {a[3]&b[0],a[2]&b[0],a[1]&b[0],a[0]&b[0]},
	   {p13,p12,p11,p10} = {a[3]&b[1],a[2]&b[1],a[1]&b[1],a[0]&b[1]},
       {p23,p22,p21,p20} = {a[3]&b[2],a[2]&b[2],a[1]&b[2],a[0]&b[2]},
       {p33,p32,p31,p30} = {a[3]&b[3],a[2]&b[3],a[1]&b[3],a[0]&b[3]};

//stage 1
ha ha10 (.a(p01),.b(p10),.s(s10),.c(c10));
fa fa11 (.a(p02),.b(p11),.cin(p20),.s(s11),.cout(c11));
fa fa12 (.a(p03),.b(p12),.cin(p21),.s(s12),.cout(c12));
fa fa13 (.a(p13),.b(p22),.cin(p31),.s(s13),.cout(c13));

//stage 2
ha ha20 (.a(s11),.b(c10),.s(s20),.c(c20));
fa fa21 (.a(p30),.b(s12),.cin(c11),.s(s21),.cout(c21));
ha ha22 (.a(s13),.b(c12),.s(s22),.c(c22));
fa fa23 (.a(p23),.b(p32),.cin(c13),.s(s23),.cout(c23));

//stage 3
rca_4bit rca1(
	.a({p33,s23,s22,s21}),
	.b({c23,c22,c21,c20}),
	.cin(1'b0),
	.cout(p[7]),
	.s(p[6:3])
);

assign p[2:0] = {s20,s10,p00};

endmodule 