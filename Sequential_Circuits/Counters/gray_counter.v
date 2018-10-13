module gray_counter #(parameter n=4)
(	input clk,rst,
	output [n-1:0]count);

wire [n-1:0]temp;
upcounter_nbit upcount1 (.clk(clk),.rst(rst),.count(temp));
nbit_bin_gray g2b1 (.B(temp),.G(count));

endmodule 