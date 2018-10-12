module test1_shift
(	input clk,rst,e,
	output reg a);

reg b,c,d;

always @(posedge clk, negedge rst)
begin
	if(!rst)
		{a,b,c,d} <= 4'b0000;
	else
	begin
		a <= b;
		b <= c;
		c <= d;
		d <= e;
	end
end

endmodule 