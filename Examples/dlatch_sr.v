module dlatch_sr
(input d,clr,e,
output q,qb);

srlatch_st sr1(d,~d,clr,e,q,qb);

endmodule 