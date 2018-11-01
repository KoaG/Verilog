module add1_5b(
    input [4:0]a,
    input b,
    output [4:0]s
);

wire csel;
ha ha1(.a(a[0]),.b(b),.s(s[0]),.c(csel));
csa_4bit csa1(.a(a[4:1]),.b(4'b0),.cin(csel),.s(s[4:1]),.cout());

endmodule