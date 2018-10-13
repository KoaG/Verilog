module decoder3to8
(input [2:0]i,
output reg [7:0]y);

always @(i)
begin
	case(i)
		3'b000 : y = 8'hfe;
		3'b001 : y = 8'hfd;
		3'b010 : y = 8'hfb;
		3'b011 : y = 8'hf7;
		3'b100 : y = 8'hef;
		3'b101 : y = 8'hdf;
		3'b110 : y = 8'hbf;
		3'b111 : y = 8'h7f;
	endcase
end

endmodule 