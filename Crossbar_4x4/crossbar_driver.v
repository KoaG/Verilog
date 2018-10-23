module crossbar_driver(
    input clk,rst,
    output reg hit,miss
    );

wire cen_in,cen_out,req_in,req_out;
wire start_in,start_out;
wire [9:0]addr_in,addr_out;
wire [14:0]op0,op1,op2,op3;
wire [0:63]in_data,out_data;
wire [0:63]odata1,odata2;

ROM_mem_file_in in_mem(
    .clk(clk),
    .cen(cen_in),
    .addr(addr_in),
    .dout(in_data)
);

ROM_mem_file_out out_mem(
    .clk(clk),
    .cen(cen_out),
    .addr(addr_out),
    .dout(out_data)
);

memory_controller mem_in(
    .clk(clk),
    .rst(rst),
    .req(req_in),
    .cen(cen_in),
    .start(start_in),
    .addr(addr_in)
);

memory_controller_output mem_out(
    .clk(clk),
    .rst(rst),
    .req(req_out),
    .cen(cen_out),
    .start(start_out),
    .addr(addr_out)
);

switch crossbar(
    .clk(clk),
    .rst(rst),
    .start(start_in),
    .iport0(in_data[1:15]),
    .iport1(in_data[17:31]),
    .iport2(in_data[33:47]),
    .iport3(in_data[49:63]),
    .req(req_in),
    .ready(req_out),
    .oport0(op0),
    .oport1(op1),
    .oport2(op2),
    .oport3(op3)
);

buffer buff_out1(
    .clk(clk),
    .rst(rst),
    .din({{1'b0,op0},{1'b0,op1},{1'b0,op2},{1'b0,op3}}),
    .dout(odata1)
);

buffer buff_out2(
    .clk(clk),
    .rst(rst),
    .din(odata1),
    .dout(odata2)
);

always @(posedge clk, posedge rst) begin
    if(rst) begin
        hit <= 1'b0;
        miss <= 1'b0;
    end
    else if(odata2 == out_data && start_out) begin
        hit <= 1'b1;
        miss <= 1'b0;
    end
    else if(odata2 != out_data && start_out) begin
        hit <= 1'b0;
        miss <= 1'b1;
    end
    else begin
        hit <= 1'b0;
        miss <= 1'b0;
    end
end

endmodule