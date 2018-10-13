module upcounter_nbit_async #(parameter n=4)
(	input clk,clr,
	output reg [n-1:0]count);

always @(posedge clk, negedge clr)
begin
	if(!clr)
		count <= {n{1'b0}};
	else 
		count <= count + 1'b1;
end

endmodule 