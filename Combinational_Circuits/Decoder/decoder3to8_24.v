module decoder3to8_24
(input en,[2:0]i,
output [7:0]y);

wire en1,en2;
mux2to1 mux1 (.sel(en),.i({1'b1,i[2]}),.y(en1));
mux2to1 mux2 (.sel(en),.i({1'b1,~i[2]}),.y(en2));
decoder2to4 dcode1 (.en(en1),.i(i[1:0]),.y(y[3:0]));
decoder2to4 dcode2 (.en(en2),.i(i[1:0]),.y(y[7:4]));

endmodule 