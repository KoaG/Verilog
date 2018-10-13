module mux8to1_4
(input [2:0]sel,
input [7:0]i,
output y);

wire m1,m2;

mux4to1_2to1 mux1 (.i(i[3:0]),.sel(sel[1:0]),.y(m1));
mux4to1_2to1 mux2 (.i(i[7:4]),.sel(sel[1:0]),.y(m2));
mux4to1_2to1 mux3 (.i({m2,2'b00,m1}),.sel({sel[2],sel[2]}),.y(y));

endmodule 