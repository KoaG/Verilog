module mux_sel_gen(
    input [1:0]ip0s,ip1s,ip2s,ip3s,
    input en0,en1,en2,en3,
    output [3:0]sel0,sel1,sel2,sel3
);

decoder d0(.x(ip0s),.en(en0),.y(sel0));
decoder d1(.x(ip1s),.en(en1),.y(sel1));
decoder d2(.x(ip2s),.en(en2),.y(sel2));
decoder d3(.x(ip3s),.en(en3),.y(sel3));

endmodule