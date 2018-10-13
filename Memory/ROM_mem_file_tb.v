module ROM_mem_file_tb ();

reg [1:0]addr;
wire [3:0]dout;

ROM_mem_file ROM1(.addr(addr),.dout(dout));

initial begin
	addr = 2'b00;
	#100 addr = 2'b01;
	#120 addr = 2'b10;
	#80 addr = 2'b11;
end

initial
	$monitor($time," addr = %b, dout = %b ",addr,dout);
endmodule 