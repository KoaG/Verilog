module adder_24(
    input [23:0]a,b,
    output cout,[23:0]s
);

/*
    a[7:4]
    a[11:8]
    a[15:12]
    a[19:16]
    a[23:20]
*/
wire [5:0]csel;
cla_4bit_0 cla1(.a(a[3:0]),.b(b[3:0]),.s(s[3:0]),.cout(csel[0]));
generate begin:csa_adder
    genvar i;
    for( i = 0 ; i < 5 ; i = i+1 ) begin:f1
        csa_4bit csa_gn(.a(a[(7+4*i):(4+4*i)]),.b(b[(7+4*i):(4+4*i)]),.cin(csel[i]),.s(s[(7+4*i):(4+4*i)]),.cout(csel[i+1]));
    end
end
endgenerate
assign cout = csel[5];

endmodule