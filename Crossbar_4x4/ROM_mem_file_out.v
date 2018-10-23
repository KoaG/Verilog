module ROM_mem_file_out (
	input clk,cen,[9:0]addr,
	output reg [63:0]dout
);

reg [0:63]mem[0:1023];

initial
	$readmemh("output.mem",mem);

always @(posedge clk) begin
	if(cen)
		dout <= mem[addr];
end

endmodule 