`timescale 1ns / 1ps
module nbit_counter #(parameter N=8)(
    input clk,rst,
    output done
    );

reg [N-1:0]count;
always @(posedge clk) begin
    if(rst)
        count <= {N{1'b0}};
     else
        count <= count + 1'b1;
end

assign done = (count == {N{1'b1}});
    
endmodule
