module ROM_mem_file (
	input [1:0]addr,
	output [3:0]dout
);

reg [3:0]mem[0:3];

assign dout = mem[addr];

initial
	$readmemb("mem.txt",mem);

endmodule 