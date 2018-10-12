module demux8to1_2
(input i,[2:0]sel,
output [7:0]y);

wire [1:0]d1;
demux2to1 dmux1 (.i(i),.sel(sel[2]),.y(d1));

wire [1:0]d2,d3;
demux2to1 dmux2 (.i(d1[0]),.sel(sel[1]),.y(d2));
demux2to1 dmux3 (.i(d1[1]),.sel(sel[1]),.y(d3));

demux2to1 dmux4 (.i(d2[0]),.sel(sel[0]),.y(y[1:0]));
demux2to1 dmux5 (.i(d2[1]),.sel(sel[0]),.y(y[3:2]));
demux2to1 dmux6 (.i(d3[0]),.sel(sel[0]),.y(y[5:4]));
demux2to1 dmux7 (.i(d3[1]),.sel(sel[0]),.y(y[7:6]));

endmodule 