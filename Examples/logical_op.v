module logical_op
(input [3:0]a,b,
output le,li,ce,ci);

assign le = a == b,
		li = a != b,
		ce = a === b,
		ci = a !==b;

endmodule 