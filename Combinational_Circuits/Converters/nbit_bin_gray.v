module nbit_bin_gray #(parameter n = 4)
(input [n-1:0]B,
output [n-1:0]G);

assign G = {B[n-1],B[n-1:1]^B[n-2:0]};

endmodule 