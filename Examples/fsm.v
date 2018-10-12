module fsm
(input clk,rst,i,
output reg y);

reg [1:0]ps,ns;
parameter s0 = 2'b00,s1 = 2'b01,s2 = 2'b10,s3 = 2'b11;

always @(posedge clk)
begin
	if (!rst)
	begin
		ps <= s0;
		y <= 1'b0;
	end
	else
		ps <= ns;
end

always @(ps,i)
begin
	case(ps)
		s0 : begin
					if(i)
					begin
						ns <= s1;
						y <= 1'b0;
					end
					else
					begin
						ns <= s0;
						y <= 1'b0;
					end
				end		
		s1 : begin
					if(i)
					begin
						ns <= s2;
						y <= 1'b0;
					end
					else
					begin
						ns <= s0;
						y <= 1'b0;
					end
				end
		s2 : begin
					if(i)
					begin
						ns <= s2;
						y <= 1'b0;
					end
					else
					begin
						ns <= s3;
						y <= 1'b0;
					end
				end
		s3 : begin
					if(i)
					begin
						ns <= s1;
						y <= 1'b1;
					end
					else
					begin
						ns <= s0;
						y <= 1'b0;
					end
				end		
	endcase
end

endmodule 