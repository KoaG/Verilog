module srlatch_st
(input s,r,clr,e,
output q,qb);

nand nand1 (s1,s,e,clr);
nand nand2 (r1,r,e);
nand nand3 (q,s1,qb);
nand nand4 (qb,r1,q,clr);

endmodule 