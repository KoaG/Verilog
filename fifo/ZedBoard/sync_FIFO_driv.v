`timescale 1ns / 1ps
module sync_FIFO_driv #(parameter DATA_WIDTH = 4, FIFO_DEPTH = 8)(
	input clk,rst,we,re,
	input [DATA_WIDTH-1:0]din,
	input load,
	output empty,full,rd_err,wr_err,
	output [DATA_WIDTH-1:0]dout
	);

wire en;
sw_read sw1(.sw(load),.clk(clk),.rst(rst),.y(en));

reg [DATA_WIDTH-1:0]din_reg;
reg we_reg,re_reg;

wire wempty,wfull,wrd_err,wwr_err;
wire [DATA_WIDTH-1:0]wdout;
wire we_r,re_r;
assign we_r = we_reg & en,
        re_r = re_reg & en;
sync_FIFO #(.DATA_WIDTH(4), .FIFO_DEPTH(8)) 
          FIFO( .clk(clk),
                //.rst(rst),
                .en(en),
                .we(we),
                .re(re),
                .din(din),
                .empty(empty),
                .full(full),
                .wr_err(wr_err),
                .rd_err(rd_err),
                .dout(dout)
                );

//dff #(1) dwerr(.d(wwr_err),.clk(clk),.rst(rst),.en(en),.q(rd_err));
//dff #(1) drerr(.d(wrd_err),.clk(clk),.rst(rst),.en(en),.q(wr_err));
//dff #(1) dempty(.d(wempty),.clk(clk),.rst(rst),.en(en),.q(empty));
//dff #(1) dfull(.d(wfull),.clk(clk),.rst(rst),.en(en),.q(full));
//dff #(DATA_WIDTH) ddata(.d(wdout),.clk(clk),.rst(rst),.en(en),.q(dout));

/*
always @(posedge clk) begin
    if(rst) begin
        we_reg <= 1'b0;
        re_reg <= 1'b0;
        din_reg <= {DATA_WIDTH{1'b0}};
    end else begin
        we_reg <= we;
        re_reg <= re;
        din_reg <= din;
    end
end*/
	
endmodule
