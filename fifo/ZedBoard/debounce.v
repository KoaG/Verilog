`timescale 1ns / 1ps
module debounce #(parameter N=8)(
    input sw,
    input clk,rst,
    output reg dsw
    );


reg FF0,FF1,FF3;
wire done;
wire srst = FF0 ^ FF1;
nbit_counter #(N) counter(.clk(clk),.rst(srst),.done(done));

always @(posedge clk) begin
    if(rst) 
        dsw <= 1'b0;
    else begin
        FF0 <= sw;
        FF1 <= FF0;
        if(done)
            dsw <= FF1;
        else
            dsw <= dsw;
    end
end

endmodule
