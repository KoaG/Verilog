module UART_TX_tb();

//Inputs
reg sclk,sclr;
reg [2:0]umode;
reg [1:0]smode;
reg [4:0]bmode;
reg tx_en;
reg [7:0]tx_data;

//Outputs
wire tx;
wire tx_done;

//UUT
UART_TX uut(
	.SCLK(sclk),
	.SCLR(sclr),
	.TX_DATA(tx_data),
	.TX_EN(tx_en),
	.UMODE(umode),
	.SMODE(smode),
	.BMODE(bmode),
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
	@(posedge sclk) sclr = 1'b1; 
	umode = 3'b110;
	smode = 2'b00;
	bmode = 5'b01000;
  tx_en = 1'b0; tx_data = 8'ha1;
	#(2*B9600*TP)
	@(posedge sclk) sclr = 1'b0;
	#(10*TP)
	#(8*B9600*TP)
	@(posedge sclk) tx_en = 1'b1;
	#(2*B9600*TP)
	@(posedge sclk) tx_en = 1'b0;
	#(8*B9600*TP)
	//STR
	#(8*B9600*TP)
	//D1
	#(8*B9600*TP)
	//D2
	#(8*B9600*TP)
	//D3
	#(8*B9600*TP)
	//D4
	#(8*B9600*TP)
	//D5
	#(8*B9600*TP)
	//D6
	#(8*B9600*TP)
	//D7
	#(8*B9600*TP)
	//STP
	#(8*B9600*TP)
	//DONE
	#(8*B9600*TP)
	$stop;
end

endmodule
