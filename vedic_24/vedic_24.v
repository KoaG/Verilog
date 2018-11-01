module vedic_24(
    input [23:0]a,b,
    output [47:0]p
);

wire [23:0]pp[3:0];
//Partial Product
vedic_12 v121(.a(a[11:0]),.b(b[11:0]),.p(pp[0]));
vedic_12 v122(.a(a[11:0]),.b(b[23:12]),.p(pp[1]));
vedic_12 v123(.a(a[23:12]),.b(b[11:0]),.p(pp[2]));
vedic_12 v124(.a(a[23:12]),.b(b[23:12]),.p(pp[3]));

wire [23:0]s,c;
//fa stage:0
generate begin:stage_0
    genvar i,j;
    for( i = 0 ; i < 2 ; i = i+1 ) begin:f1
        for( j = 0 ; j < 12 ; j = j+1 ) begin:f1
            fa fa_gn(.a(pp[i][j+12]),.b(pp[i+1][j+12*i]),.cin(pp[i+2][j]),.s(s[j+12*i]),.cout(c[j+12*i]));
        end
    end
end
endgenerate

wire co;
//final stage
assign p[12:0] = {s[0],pp[0][11:0]};
adder_24 add241(.a({pp[3][12],s[23:1]}),.b(c),.s(p[36:13]),.cout(co));
add1_11b add1111(.a(pp[3][23:13]),.c(co),.s(p[47:37]));

endmodule