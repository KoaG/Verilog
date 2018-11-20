`timescale 1ns / 1ps
module sw_read(
    input sw,
    input clk,rst,
    output y
    );

wire dsw;
debounce #(16) db(.sw(sw),
                    .clk(clk),
                    .rst(rst),
                    .dsw(dsw));

pos_edge_det ped(.x(dsw),
                    .clk(clk),
                    .rst(rst),
                    .pos_edge(y));                    

                   
    
endmodule
