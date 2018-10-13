module coverage_test(
	input sel,
	output reg y
);

always @(sel) begin
	case(sel)
		1'b0 : y = 1'b0;
		1'b1 : y = 1'b1;
		1'bz : y = 1'bz;
		1'bx : y = 1'bx;
		default : y = 1'b?;
	endcase
end

endmodule 