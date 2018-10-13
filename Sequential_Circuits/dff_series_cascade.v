module dff_series_cascade #(parameter n = 16)(
	input clk,rst,
	input [n-1:0]d,
	output [n-1:0]q
);

wire [n-1:0]w;
dff_series #(.m(16),.n(12)) d1(.clk(clk),.rst(rst),.d(d),.q(w));
dff_series #(n) d2(.clk(clk),.rst(rst),.d(w),.q(q));


/*defparam d1.n = n;
dff_series d1(.clk(clk),.rst(rst),.d(d),.q(w));
defparam d2.n=16;
dff_series d2(.clk(clk),.rst(rst),.d(w),.q(q));
*/
endmodule 