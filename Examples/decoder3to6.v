module decoder3to6
(input en,[2:0]i,
output [5:0]y);

wire a1,a2,m1,m2;
and and1 (a1,i[2],~i[1]);
not not1 (a2,a1);
mux2to1 mux1 (.sel(en),.i({1'b1,i[2]}),.y(m1));
mux2to1 mux2 (.sel(en),.i({1'b1,a2}),.y(m2));

decoder2to4 dcode1 (.en(m1),.i(i[1:0]),.y(y[3:0]));
decoder1to2 dcode2 (.en(m2),.i(i[0]),.y(y[5:4]));

endmodule 