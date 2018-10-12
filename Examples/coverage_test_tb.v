module coverage_test_tb();

reg sel;
wire y;
coverage_test ct1(.sel(sel),.y(y));

initial begin
	sel = 1'b0;
	#20 sel = 1'b1;
	#20 sel = 1'bx;
	#20 sel = 1'bz;
	#20 sel = 1'bx;
	#20 sel = 1'b1;
	#20 sel = 1'b0;
	#20 sel = 1'b1;
	#20 sel = 1'b0;
	#20 sel = 1'b?;
end

initial
	$monitor($time,"sel = %b y = %b",sel,y);

endmodule 