module adder_12(
    input [11:0]a,b,
    output cout,[11:0]s
);

wire csel0,csel1;

cla_4bit_0 cla1(.a(a[3:0]),.b(b[3:0]),.s(s[3:0]),.cout(csel0));
csa_4bit csa1(.a(a[7:4]),.b(b[7:4]),.cin(csel0),.s(s[7:4]),.cout(csel1));
csa_4bit csa2(.a(a[11:8]),.b(b[11:8]),.cin(csel1),.s(s[11:8]),.cout(cout));

endmodule