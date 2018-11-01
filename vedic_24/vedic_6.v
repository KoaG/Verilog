module vedic_6(
    input [5:0]a,b,
    output [11:0]p
);

wire [5:0]pp[0:3];
//Partial Products
vedic_3 v30(.a(a[2:0]),.b(b[2:0]),.p(pp[0]));
vedic_3 v31(.a(a[2:0]),.b(b[5:3]),.p(pp[1]));
vedic_3 v32(.a(a[5:3]),.b(b[2:0]),.p(pp[2]));
vedic_3 v33(.a(a[5:3]),.b(b[5:3]),.p(pp[3]));

wire [2:0]check[0:5];
wire [5:0]s,c;
//fa stage:0
generate begin:stage_0
    genvar i,j;
    for( i = 0 ; i < 2 ; i = i+1 ) begin:f1
        for ( j = 0 ; j < 3 ; j = j+1 ) begin:f2
            //assign check[j+3*i] = j+3*i;
            fa fa_g(.a(pp[i][3+j]),.b(pp[i+1][j+3*i]),.cin(pp[i+2][j]),.s(s[j+3*i]),.cout(c[j+3*i]));
        end
    end
end
endgenerate
/*/
fa fa1(.a(pp[0][3]),.b(pp[1][0]),.cin(pp[2][0]),.s(s[0]),.cout(c[0]));
fa fa2(.a(pp[0][4]),.b(pp[1][1]),.cin(pp[2][1]),.s(s[1]),.cout(c[1]));
fa fa3(.a(pp[0][5]),.b(pp[1][2]),.cin(pp[2][2]),.s(s[2]),.cout(c[2]));
fa fa4(.a(pp[1][3]),.b(pp[2][3]),.cin(pp[3][0]),.s(s[3]),.cout(c[3]));
fa fa5(.a(pp[1][4]),.b(pp[2][4]),.cin(pp[3][1]),.s(s[4]),.cout(c[4]));
fa fa6(.a(pp[1][5]),.b(pp[2][5]),.cin(pp[3][2]),.s(s[5]),.cout(c[5]));
*/
wire co;
//final stage:1
assign p[3:0] = {s[0],pp[0][2:0]};
adder_6 add61(.a({pp[3][3],s[5:1]}),.b(c),.s(p[9:4]),.cout(co));
add1_2b add21(.a(pp[3][5]),.b(pp[3][4]),.c(co),.s(p[11:10]));

endmodule