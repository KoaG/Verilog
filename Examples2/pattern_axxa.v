module pattern_axxa(
	input	clk,rst,x,
	output reg y
);

reg [3:0]ps,ns;
parameter gN = 4'd0,
		g0 = 4'd1,
		g1 = 4'd2,
		g00 = 4'd3,
		g01 = 4'd4,
		g10 = 4'd5,
		g11 = 4'd6,
		g000 = 4'd7,
		g001 = 4'd8,
		g010 = 4'd9,
		g011 = 4'd10,
		g100 = 4'd11,
		g101 = 4'd12,
		g110 = 4'd13,
		g111 = 4'd14;

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
				end
		g0	:	begin
				if(x)
					{ns,y} = {g01,1'b0};
				else
					{ns,y} = {g00,1'b0};
				end
		g1	:	begin
				if(x)
					{ns,y} = {g11,1'b0};
				else
					{ns,y} = {g10,1'b0};
				end
		g00	:	begin
				if(x)
					{ns,y} = {g001,1'b0};
				else
					{ns,y} = {g000,1'b0};
				end
		g01	:	begin
				if(x)
					{ns,y} = {g011,1'b0};
				else
					{ns,y} = {g010,1'b0};
				end
		g10	:	begin
				if(x)
					{ns,y} = {g101,1'b0};
				else
					{ns,y} = {g100,1'b0};
				end
		g11	:	begin
				if(x)
					{ns,y} = {g111,1'b0};
				else
					{ns,y} = {g110,1'b0};
				end
		g000:	begin
				if(x)
					{ns,y} = {g001,1'b0};
				else
					{ns,y} = {g000,1'b1};
				end
		g001:	begin
				if(x)
					{ns,y} = {g011,1'b0};
				else
					{ns,y} = {g010,1'b1};
				end
		g010:	begin
				if(x)
					{ns,y} = {g101,1'b0};
				else
					{ns,y} = {g100,1'b1};
				end
		g011:	begin
				if(x)
					{ns,y} = {g111,1'b0};
				else
					{ns,y} = {g110,1'b1};
				end
		g100:	begin
				if(x)
					{ns,y} = {g001,1'b1};
				else
					{ns,y} = {g000,1'b0};
				end
		g101:	begin
				if(x)
					{ns,y} = {g011,1'b1};
				else
					{ns,y} = {g010,1'b0};
				end
		g110:	begin
				if(x)
					{ns,y} = {g101,1'b1};
				else
					{ns,y} = {g100,1'b0};
				end
		g111:	begin
				if(x)
					{ns,y} = {g111,1'b1};
				else
					{ns,y} = {g110,1'b0};
				end
		default : {ns,y} = {gN,1'b0};
	endcase
end

endmodule 