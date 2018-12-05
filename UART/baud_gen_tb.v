module baud_gen_tb();

//Inputs
reg sclk,sclr;
reg [1:0]mode;

//Outputs
wire bclk;

//UUT
baud_gen bgen1(
	.SCLK(sclk),
	.SCLR(sclr),
	.MODE(mode),
	.BAUD_CLK(bclk)
	);

//Clock Generation
localparam TP = 10;
localparam TH = TP/2;
localparam TL = TP/2;

initial sclk = 1'b0;
always begin
	if(sclk)
		#TH sclk = 1'b0;
	else 
		#TL sclk = 1'b1;
end

//Test Vectors
initial begin
	@(posedge sclk) sclr = 1'b1; mode = 2'b00;
	@(posedge sclk) sclr = 1'b0;
	#(10000*TP)
	@(posedge sclk) sclr = 1'b1; mode = 2'b01;
	@(posedge sclk) sclr = 1'b0;
	#(10000*TP)	
	@(posedge sclk) sclr = 1'b1; mode = 2'b10;
	@(posedge sclk) sclr = 1'b0;
	#(10000*TP)
	@(posedge sclk) sclr = 1'b1; mode = 2'b11;
	@(posedge sclk) sclr = 1'b0;
	#(10000*TP)
	$stop;
end

endmodule
