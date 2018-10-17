module mux8bit(
    input [7:0]ip0,ip1,
    input sel,
    output [7:0]y
);

assign y = (sel) ? ip1 : ip0;

endmodule