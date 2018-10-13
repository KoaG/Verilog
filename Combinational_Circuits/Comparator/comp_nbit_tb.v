module comp_nbit_tb #(parameter n=4);

reg [n-1:0]a,b;
wire gt,eq,lt;
integer fd;

comp_nbit comp1(.A(a),.B(b),.gt(gt),.eq(eq),.lt(lt));

initial
	fd = $fopen("comp_nbit.txt");

initial
begin
	{a,b} = {(2*n){1'b0}};
	repeat((2**(2*n))-1)
	#10 {a,b} = {a,b} + 1'b1;
	repeat(10)
	#20 {a,b} = $random();
end

initial
	$fmonitor(fd,$time," a = %d, b = %d, gt = %b, eq = %b, lt = %b",a,b,gt,eq,lt);

endmodule 