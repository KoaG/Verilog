module test_fa
(input a,b,cin,
output reg s,cout);

reg t1,t2;

always @(a,b,cin,t1,t2)
begin
	t1 <= a^b;
	s <= t1^cin;
	t2 <= (a&b)|(b&cin);
	cout <= t2|(cin&a);
end

endmodule
