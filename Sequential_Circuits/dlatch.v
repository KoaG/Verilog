module dlatch
(input D,E,
output Q1,Q1bar,Q0,Q0bar);

assign Q1 = (E) ? D : Q1,
	Q1bar = ~Q1;
assign Q0 = (~E&Q0)|(E&D),
	Q0bar = ~Q0;

endmodule 