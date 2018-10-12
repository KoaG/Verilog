module async_count_up_3bit
(input clr,clk,
output [2:0]y);

wire h = 1'b1;
tff t0 (h,clr,clk,y[0]);
tff t1 (h,clr,y[0],y[1]);
tff t3 (h,clr,y[1],y[2]);

endmodule 