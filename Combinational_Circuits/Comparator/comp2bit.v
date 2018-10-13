module comp2bit
(input A1,A0,B1,B0,
output AeqB,AgtB,AltB);

assign AeqB = (A1~^B1)&(A0~^B0);
assign AgtB = (A1&~B1)|(A0&~B1&~B0)|(A1&A0&~B0);
assign AltB = (B1&~A1)|(B0&~A1&~A0)|(B1&B0&~A0);

endmodule 