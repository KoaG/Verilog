module nbit_adder_st #(parameter n = 4)(
	input cin,[n-1:0]a,b,
	output cout,[n-1:0]s);

wire [n:0]c;
assign c[0] = cin;
assign cout = c[n];
genvar i;

generate begin:U1
	for( i=0 ; i<n ; i = i+1 )
		fa f1(.a(a[i]),.b(b[i]),.cin(c[i]),.s(s[i]),.cout(c[i+1]));
	end
endgenerate

endmodule