`timescale 1ns / 1ps
module crossbar_driver_tb();

reg clk,rst;
wire hit,miss;

crossbar_driver cd(
    .clk(clk),
    .rst(rst),
    .hit(hit),
    .miss(miss)
);

initial begin
    clk = 1'b0;
    rst = 1'b1;
end

initial #70 rst = 1'b0;

always #50 clk = ~clk;

initial #20500 $stop;

endmodule