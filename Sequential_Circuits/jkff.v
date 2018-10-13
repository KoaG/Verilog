module jkff
(input j,k,clr,clk,
output q);

and a1 (j1,~q,j);
and a2 (k1,q,k);

srlatch_st srM (j1,k1,clr,clk,qm,qmb);
srlatch_st srS (qm,qmb,clr,~clk,q);

endmodule 