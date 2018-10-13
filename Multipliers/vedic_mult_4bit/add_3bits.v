module add_3bits (
	input a,b,c,cin,
	output reg s,c0,c1
	);

wire w1,w2;
xor xor1(w1,c,cin);
xnor xnor1(w2,c,cin);

wire w3,w4,w5;
and and1(w3,c,cin);
or or1(w4,c,cin);
nand nand1(w5,c,cin);

wire w6;
and and2(w6,a,b,c,cin,w1,w2,w3,w4,w5,w6);

always @(a,b,c,cin) begin
	case({a,b})
		2'b00 : {c1,c0,s} = {w6 , w3 , w1};
		2'b01 : {c1,c0,s} = {w6 , w4 , w2};
		2'b10 : {c1,c0,s} = {w6 , w4 , w2};
		2'b11 : {c1,c0,s} = {w6 , w5 , w1};
	endcase
end

endmodule 