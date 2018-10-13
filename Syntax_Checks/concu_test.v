module concu_test
(input clk);

reg [3:0]a,b;
initial 
begin 
	a = 4'b1000;
	b = 4'b1100;
end

always @(clk)
	b<=a;
always @(clk)
	a<=b;

endmodule 