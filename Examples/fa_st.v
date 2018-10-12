module fa_st
(input a,b,cin,
output s,cout);

wire w1,w2,w3;
ha_st ha1 (.a(a),.b(b),.s(w1),.c(w2));
ha_st ha2 (.s(s),.a(w1),.c(w3),.b(cin));

or or1 (cout,w2,w3);

endmodule 