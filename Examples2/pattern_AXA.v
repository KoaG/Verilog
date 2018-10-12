module pattern_AXA
(input clk,rst,x,
output reg y);

reg[2:0]ps,ns;
parameter gN = 3'b000,
		g0 = 3'b001,
		g1 = 3'b010,
		g00 = 3'b011,
		g01 = 3'b100,
		g10 = 3'b101,
		g11 = 3'b110;

always @(posedge clk, negedge rst) begin
	if(!rst)
		ps <= gN;
	else
		ps <= ns;
end

always @(x,ps) begin
	case(ps)
		gN	:	begin
				if(x)
					{ns,y} = {g1,1'b0};
				else
					{ns,y} = {g0,1'b0};
		g0	:	begin
				if(x)
					{ns,y} = {g01,1'b0};
				else
					{ns,y} = {g00,1'b0};
		g1	:	begin
				if(x)
					{ns,y} = {g11,1'b0};
				else
					{ns,y} = {g10,1'b0};
		g00	:	begin
				if(x)
					{ns,y} = {g01,1'b0};
				else
					{ns,y} = {g00,1'b1};
		g01	:	begin
				if(x)
					{ns,y} = {g11,1'b0};
				else
					{ns,y} = {g10,1'b1};
		g10	:	begin
				if(x)
					{ns,y} = {g01,1'b1};
				else
					{ns,y} = {g00,1'b0};
		g11	:	begin
				if(x)
					{ns,y} = {g11,1'b1};
				else
					{ns,y} = {g10,1'b0};
		default : {ns,y} = {gN,1'b0};
	endcase
end

endmodule 