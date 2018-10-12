module demux1to4
(input i,[1:0]sel,
output [3:0]y);

assign y = (sel == 2'b11) ? {i,3'b000} :
	   (sel == 2'b10) ? {1'b0,i,2'b00} :
	   (sel == 2'b01) ? {2'b00,i,1'b0} : {3'b000,i};  

endmodule 