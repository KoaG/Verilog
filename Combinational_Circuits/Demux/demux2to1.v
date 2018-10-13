module demux2to1
(input i,sel,
output [1:0]y);

assign y[1] = sel&i;
assign y[0] = ~sel&i;

endmodule 