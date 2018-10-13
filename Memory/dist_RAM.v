module dist_RAM (
	input clk,we,
	input [6:0]addr,
	input [7:0]din,
	output [7:0]dout
);

reg [7:0]mem[0:127];

always @(posedge clk) begin
	if(we)
		mem[addr] <= din;
end

assign dout = mem[addr];

endmodule 