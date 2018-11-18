module dff #(parameter WIDTH=1)(
    input clr,clk,
    input [WIDTH-1:0]d,
    output reg [WIDTH-1:0]q
    );

always @(posedge clk, negedge clr) begin
    if(!clr)
        q <= {WIDTH{1'b0}};
    else
        q <= d;
end

endmodule 