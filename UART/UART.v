module UART(
	input SCLK,SCLR,
	//RX PORTs
	input RX,
	input [1:0]RX_MODE,
	output RX_ERR,
	output [7:0]RX_DATA,
	//TX PORTs
	input TX_EN,
	input [1:0]TX_MODE,
	input [7:0]TX_DATA,
	output TX,TX_DONE
	);

//UART RX
UART_RX URX(
	.SCLK(SCLK),
	.SCLR(SCLR),
	.RX(RX),
	.MODE(RX_MODE),
	.RX_ERR(RX_ERR),
	.RX_DATA(RX_DATA)	
	);

//UART TX
UART_TX UTX(
	.SCLK(SCLK),
	.SCLR(SCLR),
	.TX_EN(TX_EN),
	.MODE(TX_MODE),
	.TX_DATA(TX_DATA),
	.TX(TX),
	.TX_DONE(TX_DONE)
	);

endmodule
