module srlatch
(input S,R,
output Q,Qbar);

nand #(5) nand1(Q,S,Qbar);
nand #(5) nand2(Qbar,R,Q);

endmodule 