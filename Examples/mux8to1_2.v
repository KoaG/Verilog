module mux8to1_2
(input [2:0]sel,
input [7:0]i,
output y);

wire m1,m2,m3,m4;
mux2to1 mux1 (.sel(sel[0]),.i(i[1:0]),.y(m1));
mux2to1 mux2 (.sel(sel[0]),.i(i[3:2]),.y(m2));
mux2to1 mux3 (.sel(sel[0]),.i(i[5:4]),.y(m3));
mux2to1 mux4 (.sel(sel[0]),.i(i[7:6]),.y(m4));

wire m5,m6;
mux2to1 mux5 (.sel(sel[1]),.i({m2,m1}),.y(m5));
mux2to1 mux6 (.sel(sel[1]),.i({m4,m3}),.y(m6));

mux2to1 mux7 (.sel(sel[2]),.i({m6,m5}),.y(y));

endmodule 