module concat_test();

reg [7:0]x;
reg b;

initial begin
	x = 8'haa;
	b = 1'b1;
	#50 x = {x[7:0]&{8{b}}};
	#10 b = 1'b0;
	#50 x = {x&b};
end

initial
	$monitor($time,"x = %b, b = %b",x,b);
endmodule 