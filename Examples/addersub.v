module addersub
(input A,B,CBin,M,
output SD,CBout);

assign SD = (A==B) ? CBin : ~CBin;
assign CBout = (A==B) ? (M ? CBin : A) : (M ? B : CBin);

endmodule 