module gatedsr
(input s,r,e,
output q,qbar);

nand nand1(si,s,e);
nand nand2(ri,r,e);
nand nand3(q,si,qbar);
nand nand4(qbar,ri,q);

endmodule 