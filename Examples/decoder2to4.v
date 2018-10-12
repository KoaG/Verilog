module decoder2to4
(input en,[1:0]i,
output [3:0]y);

assign y = (en) ? 4'hf :
	   (i == 2'b00) ? 4'b1110 :
	   (i == 2'b01) ? 4'b1101 :
	   (i == 2'b10) ? 4'b1011 : 4'b0111;

endmodule 