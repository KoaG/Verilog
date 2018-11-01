module comp4to3(
    input a,b,c,d,
    output reg s,cin,cout
);

always @(a,b,c,d) begin
    case({a,b,c,d})
        4'b0000 : {cout,cin,s} = 3'b000;
        4'b0001 : {cout,cin,s} = 3'b001;
        4'b0010 : {cout,cin,s} = 3'b001;
        4'b0011 : {cout,cin,s} = 3'b010;
        4'b0100 : {cout,cin,s} = 3'b001;
        4'b0101 : {cout,cin,s} = 3'b010;
        4'b0110 : {cout,cin,s} = 3'b010;
        4'b0111 : {cout,cin,s} = 3'b011;
        4'b1000 : {cout,cin,s} = 3'b001;
        4'b1001 : {cout,cin,s} = 3'b010;
        4'b1010 : {cout,cin,s} = 3'b010;
        4'b1011 : {cout,cin,s} = 3'b011;
        4'b1100 : {cout,cin,s} = 3'b010;
        4'b1101 : {cout,cin,s} = 3'b011;
        4'b1110 : {cout,cin,s} = 3'b011;
        4'b1111 : {cout,cin,s} = 3'b100;
    endcase
end

endmodule