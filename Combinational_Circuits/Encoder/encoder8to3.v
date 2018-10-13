module encoder8to3
(input [7:0]I,
output [2:0]y);

assign y = (I == 8'hfe) ? 3'b000 :
	   (I == 8'hfd) ? 3'b001 :
	   (I == 8'hfb) ? 3'b010 :
	   (I == 8'hf7) ? 3'b011 :
	   (I == 8'hef) ? 3'b100 :
	   (I == 8'hdf) ? 3'b101 :
	   (I == 8'hbf) ? 3'b110 :
	   (I == 8'h7f) ? 3'b111 : 3'bzzz;

endmodule 