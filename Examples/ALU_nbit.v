module ALU_nbit #(parameter n = 4)
(input [n-1:0]a,b, 
input [2:0]sel,
output reg c,[n-1:0]o);

parameter add = 3'b000,
		  sub = 3'b001,
		  inc = 3'b010,
		  dec = 3'b011,
		  AND = 3'b100,
		  OR  = 3'b101,
		  XOR = 3'b110,
		  cmp = 3'b111;

always @(a,b,sel)
begin
	case(sel)
		add : {c,o} = a + b;		//add 
		sub : {c,o} = a - b;		//sub
		inc : {c,o} = a + 1'b1;		//inc
		dec : {c,o} = a - 1'b1;		//dec
		AND : {c,o} = {1'b0,a&b};	//AND
		OR  : {c,o} = {1'b0,a|b};	//OR
		XOR : {c,o} = {1'b0,a^b};	//XOR
		cmp : {c,o} = {1'b0,~a};	//cmp
		default : {c,o} = 0;
	endcase
end

endmodule 