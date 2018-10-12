module Wallace_Mult_8bit(
	input [7:0]a,b,
	output [15:0]p
	);

wire [7:0]p0,p1,p2,p3,p4,p5,p6,p7;

//Partial Products
assign p0 = {a & {8{b[0]}}},
	   p1 = {a & {8{b[1]}}},
	   p2 = {a & {8{b[2]}}},
	   p3 = {a & {8{b[3]}}},
	   p4 = {a & {8{b[4]}}},
	   p5 = {a & {8{b[5]}}},
	   p6 = {a & {8{b[6]}}},
	   p7 = {a & {8{b[7]}}};

wire [7:0]s0,c0,s1,c1;
//Stage 1
//Part 1
ha h00 (.a(p0[1]),.b(p1[0]),.s(s0[0]),.c(c0[0]));
fa fa01 (.a(p0[2]),.b(p1[1]),.cin(p2[0]),.s(s0[1]),.cout(c0[1]));
fa fa02 (.a(p0[3]),.b(p1[2]),.cin(p2[1]),.s(s0[2]),.cout(c0[2]));
fa fa03 (.a(p0[4]),.b(p1[3]),.cin(p2[2]),.s(s0[3]),.cout(c0[3]));
fa fa04 (.a(p0[5]),.b(p1[4]),.cin(p2[3]),.s(s0[4]),.cout(c0[4]));
fa fa05 (.a(p0[6]),.b(p1[5]),.cin(p2[4]),.s(s0[5]),.cout(c0[5]));
fa fa06 (.a(p0[7]),.b(p1[6]),.cin(p2[5]),.s(s0[6]),.cout(c0[6]));
ha ha07 (.a(p1[7]),.b(p2[6]),.s(s0[7]),.c(c0[7]));
//Part 2
ha h10 (.a(p3[1]),.b(p4[0]),.s(s1[0]),.c(c1[0]));
fa fa11 (.a(p3[2]),.b(p4[1]),.cin(p5[0]),.s(s1[1]),.cout(c1[1]));
fa fa12 (.a(p3[3]),.b(p4[2]),.cin(p5[1]),.s(s1[2]),.cout(c1[2]));
fa fa13 (.a(p3[4]),.b(p4[3]),.cin(p5[2]),.s(s1[3]),.cout(c1[3]));
fa fa14 (.a(p3[5]),.b(p4[4]),.cin(p5[3]),.s(s1[4]),.cout(c1[4]));
fa fa15 (.a(p3[6]),.b(p4[5]),.cin(p5[4]),.s(s1[5]),.cout(c1[5]));
fa fa16 (.a(p3[7]),.b(p4[6]),.cin(p5[5]),.s(s1[6]),.cout(c1[6]));
ha ha17 (.a(p4[7]),.b(p5[6]),.s(s1[7]),.c(c1[7]));

wire [7:0]s2,c2;
wire [6:0]s3,c3;
//Stage 2
//Part 1
ha h20 (.a(s0[1]),.b(c0[0]),.s(s2[0]),.c(c2[0]));
fa f21 (.a(s0[2]),.b(c0[1]),.cin(p3[0]),.s(s2[1]),.cout(c2[1]));
fa f22 (.a(s0[3]),.b(c0[2]),.cin(s1[0]),.s(s2[2]),.cout(c2[2]));
fa f23 (.a(s0[4]),.b(c0[3]),.cin(s1[1]),.s(s2[3]),.cout(c2[3]));
fa f24 (.a(s0[5]),.b(c0[4]),.cin(s1[2]),.s(s2[4]),.cout(c2[4]));
fa f25 (.a(s0[6]),.b(c0[5]),.cin(s1[3]),.s(s2[5]),.cout(c2[5]));
fa f26 (.a(s0[7]),.b(c0[6]),.cin(s1[4]),.s(s2[6]),.cout(c2[6]));
fa f27 (.a(c0[7]),.b(s1[5]),.cin(p2[7]),.s(s2[7]),.cout(c2[7]));
//Part 2
ha h30 (.a(c1[1]),.b(p6[0]),.s(s3[0]),.c(c3[0]));
fa f31 (.a(c1[2]),.b(p6[1]),.cin(p7[0]),.s(s3[1]),.cout(c3[1]));
fa f32 (.a(c1[3]),.b(p6[2]),.cin(p7[1]),.s(s3[2]),.cout(c3[2]));
fa f33 (.a(c1[4]),.b(p6[3]),.cin(p7[2]),.s(s3[3]),.cout(c3[3]));
fa f34 (.a(c1[5]),.b(p6[4]),.cin(p7[3]),.s(s3[4]),.cout(c3[4]));
fa f35 (.a(c1[6]),.b(p6[5]),.cin(s1[7]),.s(s3[5]),.cout(c3[5]));
fa f36 (.a(c1[7]),.b(p6[6]),.cin(p5[7]),.s(s3[6]),.cout(c3[6]));

wire [7:0]s4,c4;
wire [2:0]s5,c5;
//Stage 3
//Part 1
ha ha40 (.a(s2[1]),.b(c2[0]),.s(s4[0]),.c(c4[0]));
ha ha41 (.a(s2[2]),.b(c2[1]),.s(s4[1]),.c(c4[1]));
fa fa42 (.a(s2[3]),.b(c2[2]),.cin(c1[0]),.s(s4[2]),.cout(c4[2]));
fa fa43 (.a(s2[4]),.b(c2[3]),.cin(s3[0]),.s(s4[3]),.cout(c4[3]));
fa fa44 (.a(s2[5]),.b(c2[4]),.cin(s3[1]),.s(s4[4]),.cout(c4[4]));
fa fa45 (.a(s2[6]),.b(c2[5]),.cin(s3[2]),.s(s4[5]),.cout(c4[5]));
fa fa46 (.a(s2[7]),.b(c2[6]),.cin(s3[3]),.s(s4[6]),.cout(c4[6]));
fa fa47 (.a(c2[7]),.b(s1[6]),.cin(s3[4]),.s(s4[7]),.cout(c4[7]));
//Part 2
ha ha50 (.a(s3[5]),.b(c3[4]),.s(s5[0]),.c(c5[0]));
ha ha51 (.a(s3[6]),.b(c3[5]),.s(s5[1]),.c(c5[1]));
ha ha52 (.a(c3[6]),.b(p6[7]),.s(s5[2]),.c(c5[2]));

wire [10:0]s6,c6;
//Stage 4
ha ha60 (.a(s4[1]),.b(c4[0]),.s(s6[0]),.c(c6[0]));
ha ha61 (.a(s4[2]),.b(c4[1]),.s(s6[1]),.c(c6[1]));
ha ha62 (.a(s4[3]),.b(c4[2]),.s(s6[2]),.c(c6[2]));
fa fa63 (.a(s4[4]),.b(c4[3]),.cin(c3[0]),.s(s6[3]),.cout(c6[3]));
fa fa64 (.a(s4[5]),.b(c4[4]),.cin(c3[1]),.s(s6[4]),.cout(c6[4]));
fa fa65 (.a(s4[6]),.b(c4[5]),.cin(c3[2]),.s(s6[5]),.cout(c6[5]));
fa fa66 (.a(s4[7]),.b(c4[6]),.cin(c3[3]),.s(s6[6]),.cout(c6[6]));
fa fa67 (.a(s5[0]),.b(c4[7]),.cin(p7[4]),.s(s6[7]),.cout(c6[7]));
fa fa68 (.a(s5[1]),.b(c5[0]),.cin(p7[5]),.s(s6[8]),.cout(c6[8]));
fa fa69 (.a(s5[2]),.b(c5[1]),.cin(p7[6]),.s(s6[9]),.cout(c6[9]));
ha ha610 (.a(c5[2]),.b(p7[7]),.s(s6[10]),.c(c6[10]));

wire w1;
//Final Stage
csa_10bit csa1(.a(s6[10:1]),.b(c6[9:0]),.s(p[14:5]),.cout(w1));

assign p[15] = c6[10] ^ w1;
assign p[4:0] = {s6[0],s4[0],s2[0],s0[0],p0[0]};

endmodule 