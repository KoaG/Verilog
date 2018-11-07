module adder_24_tb();

reg [23:0]a,b;
wire cout;
wire [23:0]s;

integer hit,miss;
adder_24 dut(.a(a),.b(b),.s(s),.cout(cout));

initial begin
    {a,b} = 48'd1;
    hit = 0; miss = 0;
    repeat(1_000_000_000) begin
        #5  {a,b} = {a,b} + 48'd1;
        #1  check(a,b,s,cout);
    end
    $display("Hit = %d, Miss = %d",hit,miss);
end

task check(
    input [23:0]a,b,s,
    input cout
);
    if({cout,s} == a+b)
        hit = hit + 1;
    else
        miss = miss + 1;
endtask

endmodule