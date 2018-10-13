module mux_using_task(
	input a,b,c,d,[1:0]sel,
	output reg y);

always @(a,b,c,d,sel)
	my_task(a,b,c,d,sel,y);

task my_task
(input a,b,c,d,
input [1:0]sel,
output y);
	case(sel)
		2'b00 : y = a;
		2'b01 : y = b;
		2'b10 : y = c;
		2'b11 : y = d;
	endcase
endtask

endmodule 