module fact_tb();

reg [4:0]x;
wire [63:0]y;

fact f1(.x(x),.y(y));

integer i;

initial begin
	for(i = 0 ; i <= 31 ; i = i+1)
		#20 x = x + 1'b1;  
end

endmodule 