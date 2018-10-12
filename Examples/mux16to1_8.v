module mux16to1_8
(input [3:0]sel,
input [15:0]i,
output y);

wire m1,m2;
mux8to1_2 mux1 (.sel(sel[2:0]),.i(i[7:0]),.y(m1));
mux8to1_2 mux2 (.sel(sel[2:0]),.i(i[15:8]),.y(m2));
mux8to1_4 mux3 (.sel({sel[3],sel[3],sel[3]}),.i({m2,6'b0,m1}),.y(y));

endmodule 