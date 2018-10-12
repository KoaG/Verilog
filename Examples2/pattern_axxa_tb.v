module pattern_axxa_tb();

reg clk,rst,x;
wire y;
wire [1:0]ps,ns;
reg [31:0]si;  
integer i;
pattern_axxa pd1(.clk(clk),.rst(rst),.x(x),.y(y));

initial clk = 1'b0;
always	#50 clk = !clk;

initial
begin
	si = 32'b1111_0110_1101_0011_0101_1011_1101_1011;
	rst = 1'b0; x = 1'b0;
	#70 rst = 1'b1;
	for (i = 31 ; i >= 0 ; i = i-1)
		#120 x = si[i];
end 

initial
	$monitor($time," x = %b, y = %b",x,y);

endmodule 