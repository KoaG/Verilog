module ringcounter #(parameter n=4)
(	input clk,load,
	output reg [n-1:0]count);

always @(posedge clk)
begin
	if(load)
		count <= {1'b1,{(n-1){1'b0}}};
	else
		count <= {count[0],count[n-1:1]};
end

endmodule 