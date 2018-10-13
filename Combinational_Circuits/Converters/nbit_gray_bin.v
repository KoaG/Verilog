module nbit_gray_bin #(parameter n=4)
(input [n-1:0]G,
output [n-1:0]B);

assign B = {G[n-1],B[n-1:1]^G[n-2:0]};

endmodule 