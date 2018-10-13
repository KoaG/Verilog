module jklatch
(input j,k,clr,e,rst,
output q,qb);

wire qf,j1,k1;
mux2to1 mux1 (.sel(rst),.i({q,1'b0}),.y(qf));
nand nand1 (j1,j,~qf,e,clr);
nand nand2 (k1,k,qf,e);
nand nand3 (q,j1,qb);
nand nand4 (qb,k1,q,clr);

endmodule 