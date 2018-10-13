module ROM_with_syncread
(input clk,
input [1:0]addr,
output reg [7:0]dout);
reg [7:0]ROM[3:0];
always@ (posedge clk)
dout <= ROM[addr];

always@ (posedge clk)
begin
ROM [2'b00] <= 8'd0;
ROM [2'b01] <= 8'd1;
ROM [2'b10] <= 8'd2;
ROM [2'b11] <= 8'd15;
end
endmodule
