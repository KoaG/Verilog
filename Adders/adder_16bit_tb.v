module adder_16bit_tb ();

reg [15:0]a,b;
wire cout;
wire [15:0]sum;
integer fd;

adder_16bit add1(.a(a),.b(b),.sum(sum),.cout(cout));
reg [31:0]i;

initial begin
	fd = $fopen("adder_test.txt");
	//self_check(16'd100,16'd200);
	a = 16'd0; b = 16'd0;
	for( i = 32'd0 ; i <= {32{1'd1}} ; i = i+1'b1 ) begin
		{a,b} = {a,b} + 1'b1;
		self_check(a,b);
	end
end

task self_check(
input [15:0]ax,bx);
begin
#1	if({cout,sum} != ax + bx)
		$display("Miss %d",i);
	else
		$display("%d %d = %d %d Hit %d",a,b,cout,sum,i);
end
endtask

endmodule 