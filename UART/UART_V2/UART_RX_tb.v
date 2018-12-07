module UART_RX_tb();

//Inputs
reg sclk,sclr;
reg [2:0]umode;
reg [1:0]smode;
reg [4:0]bmode;
reg rx;

//Outputs
wire rx_err;
wire [8:0]rx_data;

//UUT
UART_RX uut(
	.SCLK(sclk),
	.SCLR(sclr),
	.UMODE(umode),
	.SMODE(smode),
	.BMODE(bmode),
	.RX(rx),
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
	@(posedge sclk) sclr = 1'b1; rx = 1'b1;
	umode = 3'b110;
	smode = 2'b00;
	bmode = 5'b01000;
	#(2*TP)
	@(posedge sclk) sclr = 1'b0;
	#(10*TP)
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B9600*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B9600*TP)
	$stop;
end

endmodule
