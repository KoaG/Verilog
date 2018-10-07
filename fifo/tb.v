module tb ();

reg clk,rst,we,re;
reg [7:0]din;
wire e,f,wr_err,rd_err;
wire [7:0]dout;

sync_FIFO fifo1(
	.clk(clk),
	.rst(rst),
	.we(we),
	.re(re),
	.din(din),
	.empty(e),
	.full(f),
	.wr_err(wr_err),
	.rd_err(rd_err),
	.dout(dout)
);

initial clk = 1'b0;
always #50 clk = !clk;

initial begin
	rst = 1'b1; we = 1'b0; re = 1'b0; din = 8'd0;
	#60 rst = 1'b0;
	#60 we = 1'b1; din = 8'd1;
	#100 din = 8'd2;
	#100 din = 8'd3;
	#100 din = 8'd4;
	#100 din = 8'd5;
	#100 din = 8'd6;
	#100 din = 8'd7;
	#100 din = 8'd8;
	#100 din = 8'd9;
	#100 din = 8'd10;
	#100 we = 1'b0;
	#100 re = 1'b1;
	#200 re = 1'b0;
	#100 we = 1'b1;
	#400 we = 1'b0;
	#100 re = 1'b1;
end

initial
	$monitor($time, " rst = %b, we = %b, re = %b, empty = %b,\
			full = %b, read error = %b, write error = %b, dout = %b",rst,we,re,e,f,rd_err,wr_err,dout);
 
endmodule 
