module demux4to1_2
(input i,[1:0]sel,
output [3:0]y);

wire [1:0]d1;
demux2to1 dmux1 (.i(i),.sel(sel[1]),.y(d1));

demux2to1 dmux2 (.i(d1[0]),.sel(sel[0]),.y(y[1:0]));
demux2to1 dmux3 (.i(d1[1]),.sel(sel[0]),.y(y[3:2]));

endmodule 