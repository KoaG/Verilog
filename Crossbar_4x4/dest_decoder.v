module dest_decoder(
    input [1:0]ip0d,ip1d,ip2d,ip3d,
    output [3:0]d0,d1,d2,d3
);

decoder dec0(.x(ip0d),.en(1'b1),.y(d0));
decoder dec1(.x(ip1d),.en(1'b1),.y(d1));
decoder dec2(.x(ip2d),.en(1'b1),.y(d2));
decoder dec3(.x(ip3d),.en(1'b1),.y(d3));

endmodule