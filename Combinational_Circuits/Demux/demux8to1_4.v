module demux8to1_4
(input i,[2:0]sel,
output [7:0]y);

wire [3:0]d1;
demux4to1_2 dmux1(.i(i),.sel({sel[2],sel[2]}),.y(d1));

demux4to1_2 dmux2(.i(d1[0]),.sel(sel[1:0]),.y(y[3:0]));
demux4to1_2 dmux3(.i(d1[3]),.sel(sel[1:0]),.y(y[7:4]));

endmodule 