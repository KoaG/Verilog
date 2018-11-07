module vedic_12_tb();

reg [11:0]a,b;
wire [23:0]p;

reg [10:0]ma,mb;

vedic_12 v12(.a(a),.b(b),.p(p));
integer hit,miss,c00,c01,c10,c11;

initial begin
    hit = 0;
    miss = 0;
    c00 = 0; c01 = 0; c10 = 0; c11 = 0;
    {ma,mb} = 22'd1;
    repeat(2**22) begin
        #5  {ma,mb} = {ma,mb} + 1'd1;
            a = {1'b1,ma}; b = {1'b1,mb};
        #1  check(a,b,p); check_msb(p);
    end
    $display("Hit = %d, Miss = %d",hit,miss);
    $display("c00 = %d, c01 = %d, c10 = %d, c11 = %d",c00,c01,c10,c11);
end

task check(
    input [11:0]a,b,
    input [23:0]p
);
    if( p == a*b )
        hit = hit + 1;
    else
        miss = miss + 1;
endtask

task check_msb(
    input [23:0]p
);
    case (p[23:22])
        2'b00 : c00 = c00 + 1;
        2'b01 : c01 = c01 + 1;
        2'b10 : c10 = c10 + 1;
        2'b11 : c11 = c11 + 1;
    endcase
endtask

endmodule