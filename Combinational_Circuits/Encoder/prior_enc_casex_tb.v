module prior_enc_casex_tb();

reg [7:0]x;
wire v;
wire [2:0]y;

prior_enc_casex pe1(.x(x),.y(y),.v(v));
integer i;

initial begin
	x = 8'b0000_0000;
	for (i = 0 ; i<255 ; i = i+1)
		#10 x = x + 1'b1;
end

initial
	$monitor($time, " x = %b , y = %b ",x,y);
endmodule 