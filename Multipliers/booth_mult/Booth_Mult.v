module Booth_Mult #(parameter Nb=2,n=2**Nb,m=2*n)(
input clk,rst,
input [n-1:0]im,iq,
output done,
output [m-1:0]p
);

reg [Nb:0]count;
reg [n-1:0]A,Q,M;
reg Q0;
wire [n-1:0]sum,diff;

always @(posedge clk) begin
    if(!rst) begin
        A <= {n{1'b0}};
        Q <= iq;
        M <= im;
        Q0 <= 1'b0;
        count <= {(Nb+1){1'b1}};
    end
    else begin
        case({Q[0],Q0})
            2'b01 : {A,Q,Q0} <= {sum[n-1],sum,Q};
            2'b10 : {A,Q,Q0} <= {diff[n-1],diff,Q};
            default : {A,Q,Q0} <= {A[n-1],A,Q};
        endcase
        count <= count + 1'b1;
    end
end
assign sum = A + M;
assign diff = A - M;
assign p = {A,Q};
assign done = (count == {Nb{1'b1}});

endmodule
