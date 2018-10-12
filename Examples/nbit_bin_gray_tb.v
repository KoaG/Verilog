module nbit_bin_gray_tb #(parameter n=4);

reg [n-1:0]b;
wire [n-1:0]g;
integer fd;

nbit_bin_gray b2g1(.B(b),.G(g));
initial
	fd = $fopen("nbit_bin_gray.txt");
initial
begin
	b = {n{1'b0}};
	repeat((2**n)-1)
	#10 b = b + 1'b1;
	repeat(10)
	#20 b = $random();
end

initial
	$fmonitor(fd,$time, "b = %b, g = %b",b,g);

endmodule 