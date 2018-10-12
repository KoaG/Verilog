module encoder8to3_bh
(input [7:0]i,
output reg v,[2:0]y);

always @(i)
begin
	case(i)
		8'h01 : {y,v} = 4'b0001;
		8'h02 : {y,v} = 4'b0011;
		8'h04 : {y,v} = 4'b0101;
		8'h08 : {y,v} = 4'b0111;
		8'h10 : {y,v} = 4'b1001;
		8'h20 : {y,v} = 4'b1011;
		8'h40 : {y,v} = 4'b1101;
		8'h80 : {y,v} = 4'b1111;
		default : {y,v} = 4'b0000;
	endcase
end

endmodule 