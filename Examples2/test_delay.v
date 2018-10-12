module test_delay();
reg [3:0]a;

initial fork
	#3 a <= 4'd0;
	#1 a <= 4'd1;
	#2 a <= 4'd2;
join

initial begin
	#2 a <= 4'd4;
	#1 a <= 4'd5;
	#3 a <= 4'd6;
end

initial 
	$monitor($time, " a = %d ", a);
endmodule 