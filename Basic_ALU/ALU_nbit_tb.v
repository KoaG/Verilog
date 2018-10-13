module ALU_nbit_tb #(parameter n =4);

reg [n-1:0]a,b;
reg [2:0]sel;
wire [n-1:0]o;
wire c;
integer fd;

ALU_nbit ALU1(.a(a),.b(b),.sel(sel),.o(o),.c(c));

/*initial
	fd = $fopen("ALU_nbit.txt");*/
initial
begin
	sel = 3'bxxx; a = 4'd0; b = 4'd0;
	#10 a = 4'd2;
	#5 {sel,a,b} = {(2*n+3){1'b0}};
	repeat(2**(2*n+3))
	#5 {sel,a,b} = {sel,a,b} + 1'b1;
	repeat(10)
	#20 {sel,a,b} = $random();
end

initial
	$monitor($time, " sel = %b, a = %b, b = %b, o = %b, c = %b",sel,a,b,o,c);

endmodule 