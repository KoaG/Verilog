module switch(
    input clk,rst,start,
    input [14:0]iport0,iport1,iport2,iport3,
    output reg req,ready,
    output reg [14:0]oport0,oport1,oport2,oport3
);

parameter idle = 3'b000,
            slot0 = 3'b001,
            slot1 = 3'b010,
            slot2 = 3'b011,
            slot3 = 3'b100,
            done = 3'b101,
            busy = 3'b110;

reg [2:0]ps_r,ns_r,ps_s,ns_s;
reg send;
wire [14:0]mem[0:3][0:3];
//reg [14:0]crossbar[0:3][0:3];
reg [1:0]count;
reg clr;

mux_fabric mf(
    .ip0pld(iport0[7:0]),.ip1pld(iport1[7:0]),.ip2pld(iport2[7:0]),.ip3pld(iport3[7:0]),
    .ip0d(iport0[12:11]),.ip1d(iport1[12:11]),.ip2d(iport2[12:11]),.ip3d(iport3[12:11]),
    .ip0s(iport0[9:8]),.ip1s(iport1[9:8]),.ip2s(iport2[9:8]),.ip3s(iport3[9:8]),
    .ip0v(iport0[14]),.ip1v(iport1[14]),.ip2v(iport2[14]),.ip3v(iport3[14]),
    .os00(mem[0][0]),.os01(mem[0][1]),.os02(mem[0][2]),.os03(mem[0][3]),
    .os10(mem[1][0]),.os11(mem[1][1]),.os12(mem[1][2]),.os13(mem[1][3]),
    .os20(mem[2][0]),.os21(mem[2][1]),.os22(mem[2][2]),.os23(mem[2][3]),
    .os30(mem[3][0]),.os31(mem[3][1]),.os32(mem[3][2]),.os33(mem[3][3]),
    /*.ss00(mem[0][0][12:11]),.ss01(mem[0][1][12:11]),.ss02(mem[0][2][12:11]),.ss03(mem[0][3][12:11]),
    .ss10(mem[1][0][12:11]),.ss11(mem[1][1][12:11]),.ss12(mem[1][2][12:11]),.ss13(mem[1][3][12:11]),
    .ss20(mem[2][0][12:11]),.ss21(mem[2][1][12:11]),.ss22(mem[2][2][12:11]),.ss23(mem[2][3][12:11]),
    .ss30(mem[3][0][12:11]),.ss31(mem[3][1][12:11]),.ss32(mem[3][2][12:11]),.ss33(mem[3][3][12:11]),*/
    .slot(count),
    .clr(clr)
);

always @(posedge clk, posedge rst) begin
    if(rst) begin
        ps_r <= idle;
        ps_s <= slot0;
    end
    else if(start) begin
        ps_r <= slot0;
        ps_s <= slot0;
    end
    else begin
        ps_r <= ns_r;
        ps_s <= ns_s;
    end
end

always @(ps_r,start,send) begin
    case(ps_r)
        idle  : begin/*
                    if(start) begin
                        clr <= 1'b0;
                        ready <= 1'b0;
                        count <= 2'b00;
                        req <= 1'b0;
                        ns_r <= slot0;
                    end
                    else begin*/
                        clr <= 1'b1;
                        ready <= 1'b0;
                        count <= 2'b00;
                        req <= 1'b1;
                        ns_r <= idle;
                    //end
                end
        slot0 : begin
                    clr <= 1'b0;
                    ready <= 1'b0;
                    count <= 2'b00;
                    req <= 1'b0;
                    ns_r <= slot1;/*
                    crossbar[0][0] <= mem[0][0];
                    crossbar[0][1] <= mem[0][1][10];
                    crossbar[0][2] <= mem[0][2][10];
                    crossbar[0][3] <= mem[0][3][10];
                    crossbar[1][0] <= mem[1][0][10];
                    crossbar[1][1] <= mem[1][1][10];
                    crossbar[1][2] <= mem[1][2][10];
                    crossbar[1][3] <= mem[1][3][10];
                    crossbar[2][0] <= mem[2][0][10];
                    crossbar[2][1] <= mem[2][1][10];
                    crossbar[2][2] <= mem[2][2][10];
                    crossbar[2][3] <= mem[2][3][10];
                    crossbar[3][0] <= mem[3][0][10];
                    crossbar[3][1] <= mem[3][1][10];
                    crossbar[3][2] <= mem[3][2][10];
                    crossbar[3][3] <= mem[3][3][10];*/
                end
        slot1 : begin
                    clr <= 1'b0;
                    ready <= 1'b0;
                    req <= 1'b0;
                    ns_r <= slot2;
                    count <= 2'b01;/*
                    crossbar[0][0] <= mem[0][0][10];
                    crossbar[0][1] <= mem[0][1][10];
                    crossbar[0][2] <= mem[0][2][10];
                    crossbar[0][3] <= mem[0][3][10];
                    crossbar[1][0] <= mem[1][0][10];
                    crossbar[1][1] <= mem[1][1][10];
                    crossbar[1][2] <= mem[1][2][10];
                    crossbar[1][3] <= mem[1][3][10];
                    crossbar[2][0] <= mem[2][0][10];
                    crossbar[2][1] <= mem[2][1][10];
                    crossbar[2][2] <= mem[2][2][10];
                    crossbar[2][3] <= mem[2][3][10];
                    crossbar[3][0] <= mem[3][0][10];
                    crossbar[3][1] <= mem[3][1][10];
                    crossbar[3][2] <= mem[3][2][10];
                    crossbar[3][3] <= mem[3][3][10];*/
                end
        slot2 : begin
                    clr <= 1'b0;
                    ready <= 1'b0;
                    req <= 1'b0;
                    ns_r <= slot3;
                    count <= 2'b10;/*
                    crossbar[0][0] <= mem[0][0][10];
                    crossbar[0][1] <= mem[0][1][10];
                    crossbar[0][2] <= mem[0][2][10];
                    crossbar[0][3] <= mem[0][3][10];
                    crossbar[1][0] <= mem[1][0][10];
                    crossbar[1][1] <= mem[1][1][10];
                    crossbar[1][2] <= mem[1][2][10];
                    crossbar[1][3] <= mem[1][3][10];
                    crossbar[2][0] <= mem[2][0][10];
                    crossbar[2][1] <= mem[2][1][10];
                    crossbar[2][2] <= mem[2][2][10];
                    crossbar[2][3] <= mem[2][3][10];
                    crossbar[3][0] <= mem[3][0][10];
                    crossbar[3][1] <= mem[3][1][10];
                    crossbar[3][2] <= mem[3][2][10];
                    crossbar[3][3] <= mem[3][3][10];*/
                end
        slot3 : begin
                    clr <= 1'b0;
                    ready <= 1'b0;
                    req <= 1'b0;
                    ns_r <= done;
                    count <= 2'b11;/*
                    crossbar[0][0] <= mem[0][0][10];
                    crossbar[0][1] <= mem[0][1];
                    crossbar[0][2] <= mem[0][2];
                    crossbar[0][3] <= mem[0][3];
                    crossbar[1][0] <= mem[1][0];
                    crossbar[1][1] <= mem[1][1];
                    crossbar[1][2] <= mem[1][2];
                    crossbar[1][3] <= mem[1][3];
                    crossbar[2][0] <= mem[2][0];
                    crossbar[2][1] <= mem[2][1];
                    crossbar[2][2] <= mem[2][2];
                    crossbar[2][3] <= mem[2][3];
                    crossbar[3][0] <= mem[3][0];
                    crossbar[3][1] <= mem[3][1];
                    crossbar[3][2] <= mem[3][2];
                    crossbar[3][3] <= mem[3][3];*/                    
                end
        done :  begin
                    count <= 2'b11;
                    clr <= 1'b0;
                    ready <= 1'b1;
                    req <= 1'b0;
                    ns_r <= busy;
                end
        busy :  begin
                    count <= 2'b11;
                    ready <= 1'b0;
                    if(send) begin
                        ns_r <= idle;
                        req <= 1'b1;
                        clr <= 1'b1;
                    end
                    else begin
                        clr <= 1'b0;
                        ns_r <= busy;
                        req <= 1'b0;
                    end
                end
    endcase
end

always @(ps_s,ready) begin
    case(ps_s)
        slot0 : begin
                    send <= 1'b0;
                    if(ready) begin
                        ns_s <= slot1;
                        oport0 <= mem[0][0];
                        oport1 <= mem[1][0];
                        oport2 <= mem[2][0];
                        oport3 <= mem[3][0];
                    end
                    else
                        ns_s <= slot0;
                end
        slot1 : begin
                    send <= 1'b0;
                    ns_s <= slot2;
                    oport0 <= mem[0][1];
                    oport1 <= mem[1][1];
                    oport2 <= mem[2][1];
                    oport3 <= mem[3][1];
                end
        slot2 : begin
                    send <= 1'b0;
                    ns_s <= slot3;
                    oport0 <= mem[0][2];
                    oport1 <= mem[1][2];
                    oport2 <= mem[2][2];
                    oport3 <= mem[3][2];
                end
        slot3 : begin
                    send <= 1'b0;
                    ns_s <= done;
                    oport0 <= mem[0][3];
                    oport1 <= mem[1][3];
                    oport2 <= mem[2][3];
                    oport3 <= mem[3][3];
                end
        done :  begin
                    send <= 1'b1;
                    ns_s <= slot0;
                end
    endcase
end
endmodule