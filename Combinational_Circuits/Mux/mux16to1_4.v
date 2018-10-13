module mux16to1_4
(input [3:0]sel,
input [15:0]i,
output y);

wire m1,m2,m3,m4;
mux4to1_2to1 mux1 (.sel(sel[1:0]),.i(i[3:0]),.y(m1));
mux4to1_2to1 mux2 (.sel(sel[1:0]),.i(i[7:4]),.y(m2));
mux4to1_2to1 mux3 (.sel(sel[1:0]),.i(i[11:8]),.y(m3));
mux4to1_2to1 mux4 (.sel(sel[1:0]),.i(i[15:12]),.y(m4));

mux4to1_2to1 mux5 (.sel(sel[3:2]),.i({m4,m3,m2,m1}),.y(y));

endmodule 