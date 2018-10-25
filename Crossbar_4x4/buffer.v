`timescale 1ns / 1ps
module buffer(
    input clk,rst,
    input [0:63]din,
    output reg [0:63]dout
);

always @(posedge clk, posedge rst) begin
    if(rst)
        dout <= 63'd0;
    else
        dout <= din;
end

endmodule