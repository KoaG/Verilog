module UART_TX_tb();

//Inputs
reg sclk,sclr;
reg tx_en;
reg [7:0]tx_data;
reg [1:0]mode;

//Outputs
wire tx;
wire tx_done;

//UUT
UART_TX uut(
	.SCLK(sclk),
	.SCLR(sclr),
	.TX_DATA(tx_data),
	.TX_EN(tx_en),
	.MODE(mode),
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

//Test Vectors
initial begin
	@(posedge sclk) sclr = 1'b1; mode = 2'b11; tx_en = 1'b0; tx_data = 8'ha1;
	#(2*TP)
	@(posedge sclk) sclr = 1'b0;
	#(10*TP)
	#(8*B19_2k*TP)
	@(posedge sclk) tx_en = 1'b1;
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
	$stop;
end

endmodule
