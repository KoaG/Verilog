module sort (
	input clk,rst,s,[7:0]a,b,c,d,e,
	output reg [7:0]y
);

reg [7:0]mem[0:4];

always @(posedge s) begin
	{mem[4],mem[3]} = swap(mem[4],mem[3]);
	{mem[4],mem[2]} = swap(mem[4],mem[2]);
	{mem[4],mem[1]} = swap(mem[4],mem[1]);
	{mem[4],mem[0]} = swap(mem[4],mem[0]);

	{mem[3],mem[2]} = swap(mem[3],mem[2]);
	{mem[3],mem[1]} = swap(mem[3],mem[1]);
	{mem[3],mem[0]} = swap(mem[3],mem[0]);

	{mem[2],mem[1]} = swap(mem[2],mem[1]);
	{mem[2],mem[0]} = swap(mem[2],mem[0]);

	{mem[1],mem[0]} = swap(mem[1],mem[0]);
end

reg [2:0]i;

always @(posedge clk,negedge rst) begin
	if(!rst)
		i <= 3'b000;
	else if (i == 3'b101)
		i <= 3'b000;
	else
		i <= i + 1'b1;
end

always @(i)
	y = mem[i];

function [15:0]swap
(input [7:0]a,b);
	if(a>b)
		swap = {a,b};
	else
		swap = {b,a};
endfunction

endmodule 