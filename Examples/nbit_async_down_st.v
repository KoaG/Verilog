module nbit_async_down_st #(parameter n=4)(
	input clk,rst,
	output [n-1:0]y);

wire [n-1:0]w1;
assign w1[0] = clk;
assign w1[n-1:1] = y[n-2:0];
genvar i;
generate begin:U1
	for( i=0 ; i<n ; i=i+1)
		tff t1(.t(1'b1),.clk(w1[i]),.rst(rst),.q(y[i]));
	end
endgenerate
endmodule 