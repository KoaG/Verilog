module ROM_async_read (
	input [1:0]addr,
	output reg [7:0]dout
);

always @(addr) begin
	case(addr)
		2'b00 : dout = 8'd0;
		2'b01 : dout = 8'd1;
		2'b10 : dout = 8'd2;
		2'b11 : dout = 8'd3;
	endcase
end

endmodule 