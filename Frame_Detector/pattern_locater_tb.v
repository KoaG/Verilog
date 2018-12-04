`timescale 1ns/1ps
module pattern_locater_tb();

//Inputs
reg CLK,SCLR,IN_DATA;

//Outputs
wire PDET;
wire [4:0]LOC;
wire [1:0]SEQ;

//UUT
pattern_locater ploc(
	.CLK(CLK),
	.SCLR(SCLR),
	.IN_DATA(IN_DATA),
	.PDET(PDET),
	.LOC(LOC),
	.SEQ(SEQ)
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

reg [0:19]i0 = 20'b1010_0000_1010_0000_1110;
reg [0:19]i1 = 20'b1010_0000_1010_0000_1110;
reg [0:19]i2 = 20'b1010_0000_1010_0000_1110;
reg [0:19]i3 = 20'b1010_0000_1010_0000_1110;
reg [0:59]IN;
integer i = 0;

initial begin
	SCLR = 1'b1;
	IN_DATA = 1'b0;
	IN = {i0,i1,i2,i3};
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
	@(posedge CLK) SCLR = 1'b1;
	@(posedge CLK) SCLR = 1'b0;
	for ( i=0 ; i<=59 ; i=i+1 )
		@(posedge CLK) IN_DATA = IN[i];
	$stop;
end

endmodule
