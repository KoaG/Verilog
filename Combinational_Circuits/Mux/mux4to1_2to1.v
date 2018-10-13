module mux4to1_2to1
(input [3:0]i,
input [1:0]sel,
output y);

wire m1,m2;

mux2to1 mux1 (.i(i[1:0]),.sel(sel[0]),.y(m1));
mux2to1 mux2 (.i(i[3:2]),.sel(sel[0]),.y(m2));
mux2to1 mux3 (.i({m2,m1}),.sel(sel[1]),.y(y));

endmodule 