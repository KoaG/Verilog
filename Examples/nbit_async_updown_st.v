module nbit_async_up_st #(parameter n=4)(
	input clk,rst,mode,
	output [n-1:0]y);

wire [n-1:0]w1,y1,y2;

assign w1[0] = clk;
assign w1[1:n-1] = y[0:n-2];

wire [n-2:0]w2,w3;
assign w2[n-2:0] = {y1[0:n-2]&mode};
assign w3[n-2:0] = {~y1[0:n-2]&~mode};

genvar i;
generate begin:U1
	for( i=0 ; i<n ; i=i+1) begin
		tff t1(.t(1'b1),.clk(w1[i]),.rst(rst),.q(y1[i]));
	end
	end
endgenerate

assign y = w2 | w3;

endmodule 