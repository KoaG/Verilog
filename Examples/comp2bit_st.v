module comp2bit_st
(input [1:0]a,b,
output gt,eq,lt);

wire w1,w2,w3,w4,w5,w6;

xnor xn1(w1,a[1],b[1]);
xnor xn2(w2,a[0],b[0]);
and a1(eq,w1,w2);

and a2(w3,a[1],~b[1]);
and a3(w4,a[1],a[0],~b[0]);
and a4(w5,a[0],~b[1],~b[0]);
or o1 (gt,w3,w4,w5);

nor nor1(lt,eq,gt);

endmodule 