module rca_4bit
(input cin,[3:0]a,b,
output cout,[3:0]s);

wire c0,c1,c2;
fa fa1 (a[0],b[0],cin,s[0],c0);
fa fa2 (a[1],b[1],c0,s[1],c1);
fa fa3 (a[2],b[2],c1,s[2],c2);
fa fa4 (a[3],b[3],c2,s[3],cout);

endmodule 