module encoder8to3_st
(input i7,i6,i5,i4,i3,i2,i1,i0,
output v,[2:0]y);

or or1 (y2,i7,i6,i5,i4);
or or2 (y1,i2,i3,i6,i7);
or or3 (y0,i1,i3,i5,i7);

and and1 (y[2],y2,v);
and and2 (y[1],y1,v);
and and3 (y[0],y0,v);

and a1 (w1,~i7,~i6,~i5,~i4,~i3,~i2,~i1,i0);
and a2 (w2,~i7,~i6,~i5,~i4,~i3,~i2,i1,~i0);
and a3 (w3,~i7,~i6,~i5,~i4,~i3,i2,~i1,~i0);
and a4 (w4,~i7,~i6,~i5,~i4,i3,~i2,~i1,~i0);
and a5 (w5,~i7,~i6,~i5,i4,~i3,~i2,~i1,~i0);
and a6 (w6,~i7,~i6,i5,~i4,~i3,~i2,~i1,~i0);
and a7 (w7,~i7,i6,~i5,~i4,~i3,~i2,~i1,~i0);
and a8 (w8,i7,~i6,~i5,~i4,~i3,~i2,~i1,~i0);

or o1 (v,w1,w2,w3,w4,w5,w6,w7,w8);

endmodule 