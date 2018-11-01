module vedic_12(
    input [11:0]a,b,
    output [23:0]p
);

wire [11:0]pp[3:0];
//Partial Products
vedic_6 v60(.a(a[5:0]),.b(b[5:0]),.p(pp[0]));
vedic_6 v61(.a(a[5:0]),.b(b[11:6]),.p(pp[1]));
vedic_6 v62(.a(a[11:6]),.b(b[5:0]),.p(pp[2]));
vedic_6 v63(.a(a[11:6]),.b(b[11:6]),.p(pp[3]));

wire [11:0]s,c;
//fa stage:0
generate begin:stage_0
    genvar i,j;
    for( i = 0 ; i < 2 ; i=i+1 ) begin:f1
        for( j = 0 ; j < 6 ; j=j+1 ) begin:f2
            fa fa_g(.a(pp[i][j+6]),.b(pp[i+1][j+6*i]),.cin(pp[i+2][j]),.s(s[j+6*i]),.cout(c[j+6*i]));
        end
    end
end

wire co;
//final stage
assign p[6:0] = {s[0],pp[0][5:0]};
adder_12 add121(.a({pp[3][6],s[11:1]}),.b(c),.s(p[18:7]),.cout(co));
add1_5b add151(.a(pp[3][11:7]),.b(co),.s(p[23:19]));

endgenerate


endmodule