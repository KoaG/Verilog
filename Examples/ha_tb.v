module ha_tb();

reg a,b;
wire s,c;

ha ha1(.a(a),.b(b),.s(s),.c(c));

initial
begin
	a = 1'b0; b = 1'b0;
	#10 b = 1'b1;
	#10 a = 1'b1;
	#10 b = 1'b0;
end

initial
	$monitor($time, "a = %b, b = %b, s = %b, c = %b",a,b,s,c);

endmodule 