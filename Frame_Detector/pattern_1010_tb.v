`timescale 1ns/1ps
module pattern_1010_tb();

//Inputs 
reg CLK,SCLR,IN_DATA;

//Outputs
wire PDET;

//UUT
pattern_1010 uut(
	.CLK(CLK),
	.SCLR(SCLR),
	.IN_DATA(IN_DATA),
	.PDET(PDET)
	);

//Clock Period
localparam TP = 10;
localparam TH = TP/2;
localparam TL = TP/2;

initial CLK = 1'b0;
always begin
	if(CLK)
		#TH CLK = 1'b0;
	else
		#TL CLK = 1'b1;
end

initial begin
	SCLR = 1'b1;
	IN_DATA = 1'b0;
	@(posedge CLK) SCLR = 1'b1;
	@(posedge CLK) SCLR = 1'b0;
	@(posedge CLK) IN_DATA = 1'b0;
	@(posedge CLK) IN_DATA = 1'b0;
	@(posedge CLK) IN_DATA = 1'b1;
	@(posedge CLK) IN_DATA = 1'b0;
	@(posedge CLK) IN_DATA = 1'b1;
	@(posedge CLK) IN_DATA = 1'b1;
	@(posedge CLK) IN_DATA = 1'b0;
	@(posedge CLK) IN_DATA = 1'b0;
	@(posedge CLK) IN_DATA = 1'b1;
	@(posedge CLK) IN_DATA = 1'b1;
	@(posedge CLK) IN_DATA = 1'b0;
	@(posedge CLK) IN_DATA = 1'b1;
	@(posedge CLK) IN_DATA = 1'b0;
	@(posedge CLK) IN_DATA = 1'b1;
	@(posedge CLK) IN_DATA = 1'b0;
	@(posedge CLK) IN_DATA = 1'b1;
	@(posedge CLK) IN_DATA = 1'b1;
	@(posedge CLK) IN_DATA = 1'b0;
	@(posedge CLK) IN_DATA = 1'b0;
	$stop;
end

endmodule
