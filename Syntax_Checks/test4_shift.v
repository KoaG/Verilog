module test4_shift
(	input clk,rst,e,
	output reg a);

reg b,c,d;

always @(posedge clk, negedge rst)
begin
	if(!rst)
		{a,b,c,d} <= 4'b0000;
	else
	begin
		d = e;
		c = d;
		b = c;
		a = b;
	end
end

endmodule 