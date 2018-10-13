module dlatch_st
(input d,e,
output q,qbar);

wire w1,w2;
nand nand1 (w1,d,e);
nand nand2 (w2,~d,e);
nand nand3 (q,w1,qbar);
nand nand4 (qbar,w2,q);

endmodule 