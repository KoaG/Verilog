module mux2to1
(input sel,a,b,
output y);

assign y =(~sel&a)|(sel&b)|(a&b);
//assign y0 = (~sel&a)|(sel&b);

endmodule 