module add1_2b(
    input a,b,c,
    output reg [1:0]s
);

always @(a,b,c) begin
    case({a,b,c})
        3'b000 : s = 2'b00;
        3'b001 : s = 2'b01;
        3'b010 : s = 2'b01;
        3'b011 : s = 2'b10;
        3'b100 : s = 2'b10;
        3'b101 : s = 2'b11;
        3'b110 : s = 2'b11;
        3'b111 : s = 2'b00;
    endcase
end
endmodule