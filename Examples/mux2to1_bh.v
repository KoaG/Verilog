module mux2to1_bh
(input a,b,sel,
output reg y);

always @(a,b,sel)
begin
	if (sel)
		y = b;
	else
		y = a;
end

endmodule 