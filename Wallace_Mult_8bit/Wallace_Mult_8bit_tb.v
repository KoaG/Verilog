module Wallace_Mult_8bit_tb();

reg [7:0]a,b;
wire [15:0]p;

Wallace_Mult_8bit wm(.a(a),.b(b),.p(p));

initial begin
	{a,b} = 16'd0;
	repeat(2**16) begin
	#10	if (p != a * b)
			$display("Miss %d %d %d",a,b,p);
	{a,b} = {a,b} + 1'b1;
	end
end

endmodule 