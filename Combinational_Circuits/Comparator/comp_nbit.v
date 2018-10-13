module comp_nbit #(parameter n = 4)
(input [n-1:0]A,B,
output gt,eq,lt);

assign gt = A > B;
assign eq = A == B;
assign lt = A < B;

endmodule 