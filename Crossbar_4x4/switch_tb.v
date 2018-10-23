//`timescale 1ns / 1ps
module switch_tb(
    );

reg clk,rst,start;
reg [14:0]iport0,iport1,iport2,iport3;
wire req,ready;
wire [14:0]oport0,oport1,oport2,oport3;

reg [0:63]mem[0:1023];
reg [0:63]out[0:1023];

switch crossbar(
    .clk(clk),
    .rst(rst),
    .start(start),
    .iport0(iport0),
    .iport1(iport1),
    .iport2(iport2),
    .iport3(iport3),
    .oport0(oport0),
    .oport1(oport1),
    .oport2(oport2),
    .oport3(oport3),
    .req(req),
    .ready(ready)
    );

integer a,b;

initial begin
    clk = 1'b1;
    rst = 1'b1;
    start = 1'b0;
    iport0 = 15'd0;
    iport1 = 15'd0;
    iport2 = 15'd0;
    iport3 = 15'd0;
    a = 0;
    b = 0;
end

initial begin
    $readmemh("test_cases.mem",mem);
    $readmemh("output.mem",out);
end

always #50 clk = ~clk;

initial #70 rst = 1'b0;

initial begin
    repeat(256) begin
        #100
        start = 1'b1;
        iport0 = mem[a][0:15];
        iport1 = mem[a][16:31];
        iport2 = mem[a][32:47];
        iport3 = mem[a][48:63];
        #100
        a = a + 1;
        start = 1'b0;
        iport0 = mem[a][0:15];
        iport1 = mem[a][16:31];
        iport2 = mem[a][32:47];
        iport3 = mem[a][48:63];
        #100
        a = a + 1;
        start = 1'b1;
        iport0 = mem[a][0:15];
        iport1 = mem[a][16:31];
        iport2 = mem[a][32:47];
        iport3 = mem[a][48:63];
        #100
        a = a + 1;
        start = 1'b0;
        iport0 = mem[a][0:15];
        iport1 = mem[a][16:31];
        iport2 = mem[a][32:47];
        iport3 = mem[a][48:63];
        #100
        a = a + 1;
        start = 1'b0;
        iport0 = 15'd0;
        iport1 = 15'd0;
        iport2 = 15'd0;
        iport3 = 15'd0;
        #100
        check_output_slot0(oport0,oport1,oport2,oport3);
        #100
        b = b + 1;
        check_output_slot1(oport0,oport1,oport2,oport3);
        #100
        b = b + 1;
        check_output_slot2(oport0,oport1,oport2,oport3);
        #100
        b = b + 1;
        check_output_slot3(oport0,oport1,oport2,oport3);
        #100
        b = b + 1;
        start = 1'b0;
    end
    #200 $stop;
end

task check_output_slot0(
    input [14:0]o0,o1,o2,o3
    );
    if(o0 == out[b][0:15] &&
        o1 == out[b][16:31] &&
        o2 == out[b][32:47] &&
        o3 == out[b][48:63])
        $display("Hit Slot-0, %d",b);
endtask
task check_output_slot1(
    input [14:0]o0,o1,o2,o3
    );
    if(o0 == out[b][0:15] &&
        o1 == out[b][16:31] &&
        o2 == out[b][32:47] &&
        o3 == out[b][48:63])
        $display("Hit Slot-1, %d",b);
endtask
task check_output_slot2(
    input [14:0]o0,o1,o2,o3
    );
    if(o0 == out[b][0:15] &&
        o1 == out[b][16:31] &&
        o2 == out[b][32:47] &&
        o3 == out[b][48:63])
        $display("Hit Slot-2, %d",b);
endtask
task check_output_slot3(
    input [14:0]o0,o1,o2,o3
    );
    if(o0 == out[b][0:15] &&
        o1 == out[b][16:31] &&
        o2 == out[b][32:47] &&
        o3 == out[b][48:63])
        $display("Hit Slot-3, %d",b);
endtask

endmodule