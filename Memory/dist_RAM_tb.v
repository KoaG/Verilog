module dist_RAM_tb ();

reg clk,we;
reg [7:0]din;
reg [6:0]addr;
wire [7:0]dout;

dist_RAM dR1(.clk(clk),.we(we),.din(din),.addr(addr),.dout(dout));

initial clk = 1'b0;
always #50 clk = !clk;

initial begin
	we = 1'b0;
	#60 we = 1'b1;
end

endmodule 