module test_case(
	input [1:0]sel);

always @(sel) begin
	casez(sel)
		2'b00 : $display("00");
		2'b01 : $display("01");
		2'b11 : $display("11");
		2'bxz : $display("xz");
		2'bx0 : $display("x0");
		2'bz1 : $display("z1");
		2'b10 : $display("10");
		2'bzx : $display("zx");
		2'b1z : $display("1z");
		default : $display("default");
	endcase
end
endmodule 