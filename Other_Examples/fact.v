module fact (
	input [4:0]x,
	output [63:0]y
);

assign y = my_fact(x);

function automatic [63:0]my_fact
(input [4:0]x);
	if (x==4'd0)
		my_fact = 12'd1;
	else
		my_fact = x*my_fact(x-1'b1);
endfunction

endmodule 