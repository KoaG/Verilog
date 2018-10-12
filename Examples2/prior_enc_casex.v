module prior_enc_casex(
	input [7:0]x,
	output reg v,[2:0]y);

always @(x) begin
	casex(x)
		8'b1???_???? : {y,v} = 4'b1111;
		8'b01??_???? : {y,v} = 4'b1101;
		8'b001?_???? : {y,v} = 4'b1011;
		8'b0001_???? : {y,v} = 4'b1001;
		8'b0000_1??? : {y,v} = 4'b0111;
		8'b0000_01?? : {y,v} = 4'b0101;
		8'b0000_001? : {y,v} = 4'b0011;
		8'b0000_0001 : {y,v} = 4'b0001;
		default : {y,v} = 4'b0000;
	endcase
end

endmodule 