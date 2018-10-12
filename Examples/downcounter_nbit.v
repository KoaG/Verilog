module downcounter_nbit #(parameter n=4)
(	input clk,rst,
	output reg [n-1:0]count);

always @(posedge clk)
begin
	if(!rst)
		count <= {n{1'b0}};
	else 
		count <= count - 1'b1;
end

endmodule 