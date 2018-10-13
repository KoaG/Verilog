module mux16to1_2
(input [3:0]sel,
input [15:0]i,
output y);

wire m1,m2,m3,m4,m5,m6,m7,m8;
mux2to1 mux1 (sel[0],i[1:0],m1);
mux2to1 mux2 (sel[0],i[3:2],m2);
mux2to1 mux3 (sel[0],i[5:4],m3);
mux2to1 mux4 (sel[0],i[7:6],m4);
mux2to1 mux5 (sel[0],i[9:8],m5);
mux2to1 mux6 (sel[0],i[11:10],m6);
mux2to1 mux7 (sel[0],i[13:12],m7);
mux2to1 mux8 (sel[0],i[15:14],m8);

wire m9,m10,m11,m12;
mux2to1 mux9 (sel[1],{m2,m1},m9);
mux2to1 mux10 (sel[1],{m4,m3},m10);
mux2to1 mux11 (sel[1],{m6,m5},m11);
mux2to1 mux12 (sel[1],{m8,m7},m12);

wire m13,m14;
mux2to1 mux13 (sel[2],{m10,m9},m13);
mux2to1 mux14 (sel[2],{m12,m11},m14);

mux2to1 mux15 (sel[3],{m14,m13},y);

endmodule 