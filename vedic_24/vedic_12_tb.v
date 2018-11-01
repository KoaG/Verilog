module vedic_12_tb();

reg [11:0]a,b;
wire [23:0]p;

vedic_12 v12(.a(a),.b(b),.p(p));
integer hit,miss;

initial begin
    hit = 0;
    miss = 0;
    {a,b} = 24'd1;
    repeat(2**24) begin
        #5 {a,b} = {a,b} + 1'd1;
        #1  check(a,b,p);
    end
    $display("Hit = %d, Miss = %d",hit,miss);
end

task check(
    input a,b,p
);
    if( p == a*b )
        hit = hit + 1;
    else
        miss = miss + 1;
endtask

endmodule