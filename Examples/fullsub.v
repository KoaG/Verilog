module fullsub
(input A,B,Bin,
output D,Bout);

assign D = (A == B) ? Bin : ~Bin;
assign Bout = (A==B) ? Bin : B;

endmodule 