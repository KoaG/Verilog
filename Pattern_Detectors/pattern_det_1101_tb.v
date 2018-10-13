module pattern_det_1101_tb();

reg clk,rst,x;
wire y;
reg [31:0]si;  
integer i;
pattern_det_1101 pd1(.clk(clk),.rst(rst),.x(x),.y(y));

initial
begin
	clk = 1'b0;
	forever
		#50 clk = !clk;
end
initial
begin
	si = 32'b1111_0110_1101_0011_0101_1011_1100_1011;
	rst = 1'b0; x = 1'b0;
	#51 rst = 1'b1;
	for (i = 31 ; i >= 0 ; i = i-1)
		#100 x = si[i];
	si = 32'h00000000; i = 32'h00000000;
	#1 i = ~i; si = ~si;
	#1 i = -i; si = ~si;
	#100 x = 1'b1;
	#100 x = 1'b1;
	#100 rst = 1'b0;
	#100 rst = 1'b1;
	#100 $stop;
end 

initial
	$monitor($time," x = %b, y = %b",x,y);

endmodule 