module bcdtoex_3
(input [3:0]B,
output [3:0]X);
not (w1,B[3]);
not (w2,B[2]);
not (w3,B[1]);
not (w4,B[0]);
and (w5,w1,B[2],w3,B[0]);
and (w6,B[3],w2,B[1]);
and (w7,B[1],B[2]);
and (w8,B[3],w3);
or (X[3],w5,w6,w7,w8);
and (w9,w1,B[2],w3,w4);
and (w10,w2,w3,B[0]);
and (w11,w2,B[1]);
and (w12,B[3],B[2]);
or (X[2],w9,w10,w11,w12);
and (w13,w3,w4);
and (w14,B[1],B[0]);
or (X[1],w13,w14);
and (w15,B[1],w4);
or (X[0],w13,w15);

endmodule
