module dff_series #(localparam n = 8, m = 8)(
	input clk,rst,
	input [n-1:0]d,
	output reg [n-1:0]q
);

always @(posedge clk) begin
	if(!rst)
		q <= 0;
	else
		q <= d;
end

endmodule 	