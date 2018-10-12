module mux_using_function(
	input [15:0]x,[3:0]sel,
	output y);

wire [3:0]yi;

assign yi[0] = my_mux(x[3:0],sel[1:0]),
		yi[1] = my_mux(x[7:4],sel[1:0]),
		yi[2] = my_mux(x[11:8],sel[1:0]),
		yi[3] = my_mux(x[15:12],sel[1:0]);

assign y = my_mux(yi,sel[3:2]);

function reg my_mux
(input [3:0]x,
input [1:0]sel);
	case(sel)
		2'b00 : my_mux = x[0];
		2'b01 : my_mux = x[1];
		2'b10 : my_mux = x[2];
		2'b11 : my_mux = x[3];
	endcase
endfunction

endmodule 