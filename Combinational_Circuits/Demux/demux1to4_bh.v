module demux1to4_bh
(input i,[1:0]sel,
output reg [3:0]y);

always @(i,sel)
begin
	if (sel == 2'b00) 
		y = {3'b0,i};
	else if (sel == 2'b01)
		y = {2'b00,i,1'b0};
	else if (sel == 2'b10)
		y = {1'b0,i,2'b00};
	else
		y = {i,3'b000};
end

endmodule 