module singleportBRAM(
	input clk,en,we,
	input [4:0]addr,
	input [7:0]din,
	output reg [7:0]dout);

reg [7:0]mem[0:31];

always@ (posedge clk) begin
   if(en) begin 
		if(we)
   			mem[addr] <= din;
   		dout <= mem[addr];
	end
end
 
endmodule 