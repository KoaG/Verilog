module vedic_3(
    input [2:0]a,b,
    output [5:0]p
);

wire [2:0]pp[0:2];
generate begin:gen_pp
    genvar i,j;
    for( i = 0 ; i < 3 ; i = i+1 )begin:f1
        for( j = 0 ; j < 3 ; j = j+1 )begin:f2
            assign pp[i][j] = a[i] & b[j];
        end
    end
end
endgenerate

assign p[0] = pp[0][0];
wire c1,c21,c22,c3;
ha ha1(.a(pp[0][1]),.b(pp[1][0]),.s(p[1]),.c(c1));
comp4to3 comp1(.a(pp[0][2]),.b(pp[1][1]),.c(pp[2][0]),.d(c1),.s(p[2]),.cin(c21),.cout(c22));
fa fa1(.a(pp[1][2]),.b(pp[2][1]),.cin(c21),.s(p[3]),.cout(c3));
fa fa2(.a(pp[2][2]),.b(c22),.cin(c3),.s(p[4]),.cout(p[5]));

endmodule