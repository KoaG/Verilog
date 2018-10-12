module fa_bh
(input a,b,cin,
output reg s,cout);

always @(a,b,cin)
begin
	if (a==b)
		begin
			s = cin;
			cout = a;
		end
	else 
		begin
			s = ~cin;
			cout = cin;
		end
end

endmodule 