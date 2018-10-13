module booth_tb #(parameter Nb=2, n=2**Nb, m=2*n);

reg clk,rst;
reg signed [n-1:0]im,iq;
wire pd;
wire [2*n-1:0]p;
integer i;

booth mult1(.clk(clk),.rst(rst),.im(im),.iq(iq),.pd(pd),.p(p));

initial clk = 1'b0;
always #50 clk = ~clk;
initial begin
	rst = 1'b0;
	#60 rst = 1'b1;
	#420 {im,iq} = 8'd0;
	for(i = 0 ; i <= 255 ; i = i+1) begin
		#500 rst = 1'b0; {im,iq} = {im,iq} + 1'b1;
		#100 rst = 1'b1;
	end
	for(i = 0 ; i <= 20 ; i = i+1) begin
		#500 rst = 1'b0; {im,iq} = $random();
		#100 rst = 1'b1;
	end
	#10 $stop;
end
reg signed [2*n-1:0]check;
always @(posedge pd) begin
	check = p;
	if(pd) begin
		if(check == im*iq)
			$display("Hit im %d * iq %d = check %d",im,iq,check);
		else
			$display("Miss im %d * iq %d = check %d",im,iq,check);
	end
end
endmodule 