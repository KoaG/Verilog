module mux4to1_st
(input a,b,c,d,[1:0]sel,
output y);

and a0 (w0,a,~sel[1],~sel[0]);
and a1 (w1,b,~sel[1],sel[0]);
and a2 (w2,c,sel[1],~sel[0]);
and a3 (w3,d,sel[1],sel[0]);

or or0 (y,w0,w1,w2,w3);

endmodule 