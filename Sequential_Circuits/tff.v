module tff
(input t,rst,clk,
output reg q);

always @(posedge clk, negedge rst)
begin
	if(!rst)
		q <= 1'b0;
	else
		q <= ~q;
end

endmodule 