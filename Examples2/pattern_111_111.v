module pattern_111_111
(input clk,rst,x,
output reg y);

reg [2:0]ps,ns;
parameter gN = 3'b000,
		g1 = 3'b001,
		g11 = 3'b010,
		g111 = 3'b011,
		g1111 = 3'b100,
		g11111 = 3'b101;

always @(posedge clk, negedge rst)
begin
	if(!rst)
		ps <= gN;
	else
		ps <= ns;
end

always @(x,ps)
begin
	case(ps)
		gN : begin
				if(x)
				begin
					ns = g1;
					y = 1'b0;
				end
				else
				begin
					ns = gN;
					y = 1'b0;
				end
			 end
		g1 : begin
				if(x)
				begin
					ns = g11;
					y = 1'b0;
				end
				else
				begin
					ns = gN;
					y = 1'b0;
				end
			 end
		g11 : begin
				if(x)
				begin
					ns = g111;
					y = 1'b0;
				end
				else
				begin
					ns = gN;
					y = 1'b0;
				end
			 end
		g111 : begin
				if(x)
				begin
					ns = g1111;
					y = 1'b0;
				end
				else
				begin
					ns = gN;
					y = 1'b0;
				end
			 end
		g1111 : begin
				if(x)
				begin
					ns = g11111;
					y = 1'b0;
				end
				else
				begin
					ns = gN;
					y = 1'b0;
				end
			 end
		g11111 : begin
				if(x)
				begin
					ns = g11111;
					y = 1'b1;
				end
				else
				begin
					ns = gN;
					y = 1'b0;
				end
			 end
		default : {ns,y} = {gN,1'b0};
	endcase
end

endmodule 