module prior_encoder8to3_st
(input i7,i6,i5,i4,i3,i2,i1,i0,
output v,[2:0]y);

wire w1,w2,w3,w4,w5,w6;

or or1 (v,i7,i6,i5,i4,i3,i2,i1,i0);

and a1 (w1,~i7,i6);
and a2 (w2,~i7,~i6,i5);
and a3 (w3,~i7,~i6,~i5,i4);
and a4 (w4,~i7,~i6,~i5,~i4,i3);
and a5 (w5,~i7,~i6,~i5,~i4,~i3,i2);
and a6 (w6,~i7,~i6,~i5,~i4,~i3,~i2,i1);

or or2 (y[2],i7,w1,w2,w3);
or or3 (y[1],i7,w1,w4,w5);
or or4 (y[0],i7,w2,w4,w6);

endmodule 