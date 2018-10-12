module fab_bh
(input a,b,cbin,m,
output reg sd,cbout);

always @(a,b,cbin,m)
begin
	if (a==b)
		begin
			sd = cbin;
			if (m)
				cbout = cbin;
			else
				cbout = a;
		end
	else
		begin
			sd = ~cbin;
			if (m)
				cbout = b;
			else
				cbout = cbin;
		end
end

endmodule 