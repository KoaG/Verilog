module priority_encoder8to3
(input [7:0]I,
output [2:0]y);

assign y = (I[7]) ? 3'b111 :
	   (I[6]) ? 3'b110 :
	   (I[5]) ? 3'b101 :
	   (I[4]) ? 3'b100 :
	   (I[3]) ? 3'b011 :
	   (I[2]) ? 3'b010 :
	   (I[1]) ? 3'b001 :
	   (I[0]) ? 3'b000 : 3'bzzz;

endmodule 