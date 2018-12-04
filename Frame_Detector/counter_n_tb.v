`timescale 1ns/1ps
module counter_n_tb #(parameter MOD=16)();

//Inputs
reg CLK,SCLR,CE;

//OUTPUTS
wire [$clog2(MOD)-1:0]COUNT;

//Clock Period
localparam TP = 10;
localparam TH = TP/2;
localparam TL = TP/2;

//UUT
counter_n #(.MOD(MOD)) uut(
	.CLK(CLK),
	.SCLR(SCLR),
	.CE(CE),
	.COUNT(COUNT)
	);

initial CLK = 1'b0;
always begin
	if(CLK)
		#TH CLK = 1'b0;
	else
		#TL CLK = 1'b1;
end

initial begin
	SCLR = 1'b1; CE = 1'b0;
	@(posedge CLK) SCLR = 1'b1;
	@(posedge CLK) SCLR = 1'b0; CE = 1'b1;
	#(12*TP)
	@(posedge CLK) SCLR = 1'b1;
	@(posedge CLK) SCLR = 1'b0;
	#(5*TP)
	@(posedge CLK) CE = 1'b0;
	#(5*TP)
	@(posedge CLK) CE = 1'b1;
	#(10*TP) $stop;
end

endmodule
