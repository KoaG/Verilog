module baud_gen(
	input SCLK,SCLR,
	input [4:0]BMODE,
	output reg BAUD_CLK
	);

reg [15:0]div_mem[0:31];
reg [15:0]DIV,count;

initial 
	$readmemh("div_mem.txt",div_mem);

always @(BMODE) begin
	DIV = 16'h0516;
	DIV = div_mem[BMODE];
end

always @(posedge SCLK) begin
	if(SCLR) begin
		count <= 16'd0;
		BAUD_CLK <= 1'b0;
	end else if(count == DIV) begin
		count <= 16'd0;
		BAUD_CLK <= 1'b1;
	end else begin
		count <= count + 1'b1;
		BAUD_CLK <= 1'b0;
	end
end

endmodule
