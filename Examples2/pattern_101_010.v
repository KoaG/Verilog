module pattern_101_010
(input clk,rst,x,
output reg y);

reg [2:0]ps,ns;
parameter gN = 3'b000,
		g1 = 3'b001,
		g10 = 3'b010,
		g101 = 3'b011,
		g1010 = 3'b100,
		g10101 = 3'b101;

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
					{ns,y} = {g1,1'b0};
				else
					{ns,y} = {gN,1'b0};
			 end
		g1 : begin
				if(x)
					{ns,y} = {g1,1'b0};
				else
					{ns,y} = {g10,1'b0};
			 end
		g10 : begin
				if(x)
					{ns,y} = {g101,1'b0};
				else
					{ns,y} = {gN,1'b0};
			 end
		g101 : begin
				if(x)
					{ns,y} = {gN,1'b0};
				else
					{ns,y} = {g1010,1'b0};
			 end
		g1010 : begin
				if(x)
					{ns,y} = {g10101,1'b0};
				else
					{ns,y} = {gN,1'b0};
			 end
		g10101 : begin
				if(x)
					{ns,y} = {g1010,1'b1};
				else
					{ns,y} = {g1,1'b0};
			 end
	endcase
end

endmodule 