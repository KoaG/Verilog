module sr_bh
(input s,r,e,clr,
output reg q);

always @(e)
begin
	if(!clr)
		q <= 1'b0;
	else if (!e)
		q <= q;
	else
	begin
		case({s,r})
			2'b00 : q <= q;
			2'b01 : q <= 1'b0;
			2'b10 : q <= 1'b1;
			2'b11 : q <= ~q;
		endcase
	end
end

endmodule 