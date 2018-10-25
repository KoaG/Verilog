`timescale 1ns / 1ps
module mux16bit(
    input [14:0]a,b,
    input clk,rst,sel,clr,
    output reg [14:0]y
);

wire [14:0]yi;
wire [14:0]yc;
assign yi = (sel) ? b : a;
assign yc = (clr) ? 15'd0 : yi;

always @(posedge clk,posedge rst) begin
    if(rst)
        y <= 15'd0;
    else
        y <= yc;
end

endmodule