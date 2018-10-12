module fulladder
(input A,B,Cin,
output S,Cout);

/*
assign Cout = (Cin) ? (A|B) : (A&B);
assign S = (Cin) ? (A~^B) : (A^B);
*/

assign S = (A == B) ? Cin : ~Cin;

assign Cout = (A == B) ? A : Cin;
endmodule 