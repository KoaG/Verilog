module UART_RX_tb();

//Inputs
reg sclk,sclr;
reg rx;
reg [1:0]mode;

//Outputs
wire rx_err;
wire [7:0]rx_data;

//UUT
UART_RX uut(
	.SCLK(sclk),
	.SCLR(sclr),
	.RX(rx),
	.MODE(mode),
	.RX_ERR(rx_err),
	.RX_DATA(rx_data)
	);

//Clock Generation
localparam TP = 10;
localparam TH = TP/2;
localparam TL = TP/2;

initial sclk = 1'b0;
always begin
	if(sclk)
		#TH sclk = 1'b0;
	else
		#TL sclk = 1'b1;
end

//Baudrates
localparam B4800  = 2604,
					 B9600  = 1302,
					 B14_4k = 868,
					 B19_2k = 651;

//Test Vectors
initial begin
	@(posedge sclk) sclr = 1'b1; mode = 2'b11; rx = 1'b1;
	#(2*TP)
	@(posedge sclk) sclr = 1'b0;
	#(10*TP)
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B19_2k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B19_2k*TP)
	$stop;
end

endmodule
