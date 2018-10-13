module mycounter #(parameter n=4)
(	input clk,rst,ld,en,mode,[n-1:0]data,
	output reg [n-1:0]count);

always @(posedge clk)
begin
	if(!rst)
		count <= {n{1'b0}};
	else if (ld)
		count <= data;
	else if (en)
		count <= count;
	else if (mode)
		count <= count + 1'b1;
	else
		count <= count - 1'b1;
end

endmodule 