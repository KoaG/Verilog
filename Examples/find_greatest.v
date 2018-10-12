module find_greatest (
	input [7:0]a,b,c,d,e,
	output [7:0]y);

wire [7:0]w1,w2,w3;
assign w1 = my_func(a,b),
		w2 = my_func(c,d),
		w3 = my_func(w1,w2);
assign y = my_func(w3,e);

function  [7:0]my_func
(input [7:0]a,b);
	if(a>b)
		my_func = a;
	else
		my_func = b;
endfunction

endmodule 