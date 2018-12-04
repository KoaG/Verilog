`timescale 1ns/1ps
module pattern_1010(
	input CLK,SCLR,
	input IN_DATA,
	output reg PDET
);

localparam  RST  = 3'b000,
					  G1   = 3'b001,
					  G10  = 3'b010,
					  G101 = 3'b011,
					  G1010= 3'b100;

reg [2:0]ps,ns;

always @(posedge CLK) begin
	if(SCLR)
		ps <= RST;
	else
		ps <= ns;
end

always @(ps,IN_DATA) begin
	case(ps)
		RST		:	begin
							if(IN_DATA) ns <= G1;
							else  ns <= RST;
						end
		G1		:	begin
							if(IN_DATA)	ns <= G1;
							else	ns <= G10;
						end
		G10		:	begin
							if(IN_DATA)	ns <= G101;
							else	ns <= RST;
						end
		G101	:	begin
							if(IN_DATA)	ns <= G1;
							else	ns <= G1010;
						end
		G1010	:	begin
							if(IN_DATA)	ns <= G101;
							else	ns <= RST;
						end
		default:	ns <= RST;	
	endcase
end

always @(ps) begin
	case(ps)
		G1010	:	PDET <= 1'b1;
		default :	PDET <= 1'b0;
	endcase
end

endmodule
