module add_4bits (
	input a,b,c,d,cin,
	output reg s,c1,c0
	);

wire w1,w2;
xor xor1(w1,d,cin);
not not1(w2,w1);

wire w3,w4,w5,w6;
and and1(w3,d,cin);
or or1(w4,d,cin);
not not2(w5,w3);
not not3(w6,w4);

always @(a,b,c,d,cin) begin
	case({a,b,c})
		3'b000 : {c1,c0,s} = {1'b0 , w3 , w1};
		3'b001 : {c1,c0,s} = {1'b0 , w4 , w2};
		3'b010 : {c1,c0,s} = {1'b0 , w4 , w2};
		3'b011 : {c1,c0,s} = {w3 , w5 , w1};
		3'b100 : {c1,c0,s} = {1'b0 , w4 , w2};
		3'b101 : {c1,c0,s} = {w3 , w5 , w1};
		3'b110 : {c1,c0,s} = {w3 , w5 , w1};
		3'b111 : {c1,c0,s} = {w4 , w6 , w2};	
	endcase
end

endmodule 