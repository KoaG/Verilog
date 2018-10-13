module pattern_det_1101
(input clk,rst,x,
output reg y);

reg [1:0]state,next;
parameter gotN = 2'b00,
		  got1 = 2'b01,
		 got11 = 2'b10,
		got110 = 2'b11;

//sequential logic
always @(posedge clk, negedge rst)
begin
	if(!rst)
		state <= gotN;
	else
		state <= next;
end

//combinational logic mealy 
always @(x,state)
begin
	case(state)
		gotN :  begin
					if(x)
					begin
						next = got1;
						y = 1'b0;
					end
					else
					begin
						next = gotN;
						y = 1'b0;
					end
				end
		got1 :  begin
					if(x)
					begin
						next = got11;
						y = 1'b0;
					end
					else
					begin
						next = gotN;
						y = 1'b0;
					end
				end
		got11 : begin
					if(x)
					begin
						next = got11;
						y = 1'b0;
					end
					else
					begin
						next = got110;
						y = 1'b0;
					end
				end
		got110: begin
					if(x)
					begin
						next = got1;
						y = 1'b1;
					end
					else
					begin
						next = gotN;
						y = 1'b0;
					end
				end
		//default : $display("default");
	endcase
end

endmodule 