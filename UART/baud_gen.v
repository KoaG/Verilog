module baud_gen(
	input SCLK,
	input SCLR,
	input [1:0]MODE,
	output reg BAUD_CLK
	);

localparam B4800  = 2604,
					 B9600  = 1302,
					 B14_4k = 868,
					 B19_2k = 651;

reg [11:0]count;

always @(posedge SCLK) begin
	if(SCLR) begin
		BAUD_CLK <= 1'b0;
		count <= 12'd0;
	end else begin
		case(MODE)
			2'b00	:	begin
								if(count == B4800) begin
									BAUD_CLK <= 1'b1;
									count <= 12'd0;
								end else begin
									BAUD_CLK <= 1'b0;
									count <= count + 1'b1;
								end
							end
			2'b01	:	begin
								if(count == B9600) begin
									BAUD_CLK <= 1'b1;
									count <= 12'd0;
								end else begin
									BAUD_CLK <= 1'b0;
									count <= count + 1'b1;
								end
							end
			2'b10	:	begin
								if(count == B14_4k) begin
									BAUD_CLK <= 1'b1;
									count <= 12'd0;
								end else begin
									BAUD_CLK <= 1'b0;
									count <= count + 1'b1;
								end
							end
			2'b11	:	begin
								if(count == B19_2k) begin
									BAUD_CLK <= 1'b1;
									count <= 12'd0;
								end else begin
									BAUD_CLK <= 1'b0;
									count <= count + 1'b1;
								end
							end
		endcase
	end
end

endmodule
