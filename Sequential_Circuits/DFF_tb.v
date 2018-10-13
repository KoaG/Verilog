module DFF_tb();

reg clk,rst,d;
wire q;

DFF dff1(.clk(clk),.rst(rst),.d(d),.q(q));

initial
begin
	clk = 1'b0;
	forever
		#50 clk = !clk;
end
initial
begin
	rst = 1'b0; d = 1'b0;
	#51 rst = 1'b1;
	#20 d = 1'b1;
	#100 d = 1'b1;
	#110 d = 1'b0;
end

initial
	$monitor($time, " d = %b, q = %b",d,q);

endmodule 