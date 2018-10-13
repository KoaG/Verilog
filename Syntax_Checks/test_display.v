module test_display();

reg [3:0]a;

initial
begin
	a = 4'd0;
	$display($time, " D1, a = %d", a);
	$write($time, " W1, a = %d", a);
	$monitor($time, " M1, a = %d", a);
	$strobe($time, " S1, a = %d", a);

	#5 a = 4'd1;
	$write($time, " W2, a = %d", a);
	$strobe($time, " S2, a = %d", a);
	$display($time, " D2, a = %d", a);
	$monitor($time, " M2, a = %d", a);

	#2 a <= 4'd2;
	$monitor($time, " M3, a = %d", a);
	$display($time, " D3, a = %d", a);
	$write($time, " W3, a = %d", a);
	$strobe($time, " S3, a = %d", a);

	#7 a = 4'd3;
	$display($time, " D4, a = %d", a);
	$strobe($time, " S4, a = %d", a);
	$write($time, " W4, a = %d", a);

	#4 a = 4'd4;
	$write($time, " W5, a = %d", a);
	$display($time, " D5, a = %d", a);
end

endmodule 