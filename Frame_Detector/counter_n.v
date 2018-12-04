`timescale 1ns/1ps
module counter_n #(parameter MOD=16)(
	input CLK,SCLR,CE,
	output reg [$clog2(MOD)-1:0]COUNT
	);

always @(posedge CLK) begin
	if(SCLR)
		COUNT <= 0;
	else if(CE) begin
		if(COUNT == (MOD-1)) COUNT <= 0;
		else	COUNT <= COUNT + 1'b1;
	end
end

endmodule
