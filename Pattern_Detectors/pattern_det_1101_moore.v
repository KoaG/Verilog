module pattern_det_1101_moore
(input clk,rst,x,
output reg y);

reg [2:0]state,next;
parameter gotN    = 3'b000,
		  got1    = 3'b001,
		  got11   = 3'b010,
		  got110  = 3'b011,
		  got1101 = 3'b100;

always @(posedge clk, negedge rst)
begin
	if(!rst)
		state <= gotN;
	else
		state <= next;
end

always @(x,state)
begin
	case(state)
		gotN : 	begin
					if(x)
						next = got1;
					else
						next = gotN;
				end
		got1 : 	begin
					if(x)
						next = got11;
					else
                 
						next = gotN;
				end
		got11: 	begin
					if(x)
						next = got11;
					else
						next = got110;
				end
	   got110:  begin
					if(x)
						next = got1101;
					else
						next = gotN;
				end
	  got1101: 	begin
					if(x)
						next = got11;
					else
						next = gotN;
				end
		default : next = gotN;
	endcase
end

always @(state)
begin
	case(state)
		got1101 : y = 1'b1;
		default : y = 1'b0;
	endcase
end

endmodule 