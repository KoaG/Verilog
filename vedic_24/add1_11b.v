module add1_11b(
    input [10:0]a,
    input c,
    output [10:0]s
);

ha ha1(.a(a[0]),.b(c),.s(s[0]),.c(co0));
ha ha2(.a(a[1]),.b(co0),.s(s[1]),.c(co1));
ha ha3(.a(a[2]),.b(co1),.s(s[2]),.c(csel0));
csa_4bit csa1(.a(a[6:3]),.b(4'b0),.cin(csel0),.s(s[6:3]),.cout(csel1));
csa_4bit csa2(.a(a[10:7]),.b(4'b0),.cin(csel0),.s(s[10:7]),.cout());

endmodule