module four_bit_adder
(input cin,[3:0]a,b,
output cout,[3:0]s);

wire c0,c1,c2;
assign s[0] = a[0]^b[0]^cin;
assign c0 = (a[0]&b[0])|(cin&(a[0]^b[0]));

assign s[1] = a[1]^b[1]^c0;
assign c1 = (a[1]&b[1])|(c0&(a[1]^b[1]));

assign s[2] = a[2]^b[2]^c1;
assign c2 = (a[2]&b[2])|(c1&(a[2]^b[2]));

assign s[3] = a[3]^b[3]^c2;
assign cout = (a[3]&b[3])|(c2&(a[3]^b[3]));

endmodule 