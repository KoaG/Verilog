module jk_df
(input j,k,e,
output q,qb);

assign #20 q = (~e) ? 1'b0 :
	   ({j,k} == 2'b00) ? q :
	   ({j,k} == 2'b01) ? 1'b0 :
	   ({j,k} == 2'b10) ? 1'b1 : qb;

assign #20 qb = ~q;

endmodule 