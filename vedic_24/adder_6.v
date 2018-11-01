module adder_6(
    input [5:0]a,b,
    output cout,[5:0]s
);

wire c1,csel;
ha ha1(.a(a[0]),.b(b[0]),.s(s[0]),.c(c1));
fa fa1(.a(a[1]),.b(b[1]),.cin(c1),.s(s[1]),.cout(csel));
csa_4bit csa1(.a(a[5:2]),.b(b[5:2]),.cin(csel),.s(s[5:2]),.cout(cout));

endmodule