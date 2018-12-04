`timescale 1ns/1ps
module pattern_locater(
	input CLK,SCLR,
	input IN_DATA,
	output PDET,
	output [4:0]LOC,
	output [1:0]SEQ
	);

reg CE_20,CE_3;

pattern_1010 pdetector(
	.CLK(CLK),
	.SCLR(SCLR),
	.IN_DATA(IN_DATA),
	.PDET(PDET)
	);

counter_n #(.MOD(20)) count_20(
	.CLK(CLK),
	.SCLR(SCLR),
	.CE(1'b1),
	.COUNT(LOC)
	);

counter_n #(.MOD(3)) count_3(
	.CLK(CLK),
	.SCLR(SCLR),
	.CE(CE_3),
	.COUNT(SEQ)
	);


always @(LOC) begin
	if(LOC == 5'd19)	CE_3 = 1'b1;
	else	CE_3 = 1'b0;
end

endmodule
