module mux(
	input [9:0]ip0,ip1,
	input sel,
	output reg [9:0]y
	);

always @(ip0,ip1,sel) begin
	if(sel)
		y = ip1;
	else
		y = ip0;
end

endmodule 