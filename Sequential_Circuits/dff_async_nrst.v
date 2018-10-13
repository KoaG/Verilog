module dff_async_nrst
(	input clk,rst,d,
	output reg q);

always @(posedge clk, negedge rst)
begin
	if (!rst)
		q <= 1'b0;
	else	
		q <= d;
end

endmodule 