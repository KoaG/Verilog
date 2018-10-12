module sync_FIFO_tb ();

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

always #100 din = $random();

initial begin
	rst = 1'b0;
	#100 rst = 1'b1;
	#100 rst = 1'b0;
	#100 we = 1'b0; re = 1'b0;
	#100 re = 1'b1;
	#100 we = 1'b1;
	#100 re = 1'b0;
	#400 we = 1'bx;
	#100 we = 1'b0;
	#100 re = 1'b1;
	#100 we = 1'b1;
	#100 re = 1'b0;
	#900 re = 1'bx;
	#100 re = 1'b1;
	#100 re = 1'b0; we = 1'b0;
	#100 re = 1'b1;
	#900 re = 1'b0;
	repeat(100)
	#100 {we,re} = $random();
	#100 $stop;
end

initial
	$display("		  Time rst wen ren empty full read error write error dout");

initial
	$monitor($time, "	%b	%b	%b	%b	%b	%b	%b	%b",rst,we,re,e,f,rd_err,wr_err,dout);
 
endmodule 