module decoder1to2
(input i,en,
output [1:0]y);

assign y = (en) ? 2'b11 :
	   (i) ? 2'b01 : 2'b10;

endmodule 