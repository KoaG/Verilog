module vedic_24_tb();

reg [23:0]a,b;
wire [47:0]p;

vedic_24 v24(.a(a),.b(b),.p(p));
integer hit,miss;

initial begin
    hit = 0;
    miss = 0;
    {a,b} = 48'd1;
    repeat(100) begin
        #5 {a,b} = $random() + $random();
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