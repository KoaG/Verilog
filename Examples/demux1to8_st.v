module demux1to8_st
(input i,[2:0]sel,
output [7:0]y);

and a1 (y[7],i,sel[2],sel[1],sel[0]);
and a2 (y[6],i,sel[2],sel[1],~sel[0]);
and a3 (y[5],i,sel[2],~sel[1],sel[0]);
and a4 (y[4],i,sel[2],~sel[1],~sel[0]);
and a5 (y[3],i,~sel[2],sel[1],sel[0]);
and a6 (y[2],i,~sel[2],sel[1],~sel[0]);
and a7 (y[1],i,~sel[2],~sel[1],sel[0]);
and a8 (y[0],i,~sel[2],~sel[1],~sel[0]);

endmodule 