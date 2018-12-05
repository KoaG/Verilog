module UART_tb();

//Inputs
reg sclk;
reg sclr;
//RX
reg rx;
reg [1:0]rx_mode;
//TX
reg tx_en;
reg [1:0]tx_mode;
reg [7:0]tx_data;

//Outputs
//RX
wire rx_err;
wire [7:0]rx_data;
//TX
wire tx;
wire tx_done;

//UUT
UART uut(
	.SCLK(sclk),
	.SCLR(sclr),
	.RX(rx),
	.TX_EN(tx_en),
	.RX_MODE(rx_mode),
	.TX_MODE(tx_mode),
	.TX_DATA(tx_data),
	.RX_ERR(rx_err),
	.RX_DATA(rx_data),
	.TX(tx),
	.TX_DONE(tx_done)
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

initial begin
	@(posedge sclk) 
		sclr = 1'b1; 
		rx_mode = 2'b10; rx = 1'b1;
		tx_mode = 2'b11; tx_en = 1'b0; tx_data = 8'ha1;
	#(2*TP)
	@(posedge sclk) sclr = 1'b0;
end

//Test Vectors for RX mode = 10 (14.4k baudrate)
initial begin:RX_proc
	#(10*TP)
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b0;
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B14_4k*TP)
	@(posedge sclk) rx = 1'b1;
	#(8*B14_4k*TP)
	$stop;
end

//Test Vectors for TX mode = 11 (19.2k Baudrate)
initial begin:TX_proc
	#(10*TP)
	#(8*B19_2k*TP)
	@(posedge sclk) tx_en = 1'b1;
	#(8*B19_2k*TP)
	@(posedge sclk) tx_en = 1'b0;
	#(8*B19_2k*TP)
	//STR
	#(8*B19_2k*TP)
	//D1
	#(8*B19_2k*TP)
	//D2
	#(8*B19_2k*TP)
	//D3
	#(8*B19_2k*TP)
	//D4
	#(8*B19_2k*TP)
	//D5
	#(8*B19_2k*TP)
	//D6
	#(8*B19_2k*TP)
	//D7
	#(8*B19_2k*TP)
	//STP
	#(8*B19_2k*TP)
	//DONE
	#(8*B19_2k*TP)
	@(posedge sclk) tx_en = 1'b0;
end

endmodule
