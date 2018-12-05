module UART_TX(
	input SCLK,
	input SCLR,[1:0]MODE,
	input TX_EN,
	input [7:0]TX_DATA,
	output reg TX,
	output reg TX_DONE
	);

wire BCLK;
baud_gen bgen(
	.SCLK(SCLK),
	.SCLR(SCLR),
	.MODE(MODE),
	.BAUD_CLK(BCLK)
	);

localparam STR = 4'b0000,
						D0 = 4'b0001,
						D1 = 4'b0010,
						D2 = 4'b0011,
						D3 = 4'b0100,
						D4 = 4'b0101,
						D5 = 4'b0110,
						D6 = 4'b0111,
						D7 = 4'b1000,
					 STP = 4'b1001,
					DONE = 4'b1010,
					IDLE = 4'b1011;

reg [3:0]tx_ps,tx_ns;
reg [2:0]count;
reg [7:0]DATA;

always @(posedge SCLK) begin
	if(SCLR)
			tx_ps <= IDLE;
	else /*if(TX_EN)
			tx_ps <= STR;	
	else*/
			tx_ps <= tx_ns;
end

always @(tx_ps,BCLK,TX_EN) begin
	if(BCLK || TX_EN) begin
		case(tx_ps)
		 IDLE	: begin	//Wait for TX_EN to start TX
							count <= 3'd0;
							TX <= 1'b1;							
							if(TX_EN) tx_ns <= STR;
							else tx_ns <= IDLE;
						end
			STR	:	begin
							TX <= 1'b0; //Start Bit
							DATA <= TX_DATA; //Storing DATA for TX
							if(count == 3'd7) begin
								count <= 3'd0;
								tx_ns <= D0;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= STR;
							end
						end
			 D0	:	begin
							TX <= DATA[0];	//LSB First
							if(count == 3'd7) begin
								count <= 3'd0;
								tx_ns <= D1;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D0;
							end
						end
			 D1	:	begin
							TX <= DATA[1];
							if(count == 3'd7) begin
								count <= 3'd0;
								tx_ns <= D2;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D1;
							end
						end
			 D2	:	begin
							TX <= DATA[2];
							if(count == 3'd7) begin
								count <= 3'd0;
								tx_ns <= D3;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D2;
							end	
						end
			 D3	:	begin
							TX <= DATA[3];
							if(count == 3'd7) begin
								count <= 3'd0;
								tx_ns <= D4;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D3;
							end
						end
			 D4	:	begin
							TX <= DATA[4];
							if(count == 3'd7) begin
								count <= 3'd0;
								tx_ns <= D5;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D4;
							end
						end
			 D5	:	begin
							TX <= DATA[5];
							if(count == 3'd7) begin
								count <= 3'd0;
								tx_ns <= D6;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D5;
							end
						end
			 D6	:	begin
							TX <= DATA[6];
							if(count == 3'd7) begin
								count <= 3'd0;
								tx_ns <= D7;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D6;
							end
						end
			 D7	:	begin		//MSB Last
							TX <= DATA[7];
							if(count == 3'd7) begin
								count <= 3'd0;
								tx_ns <= STP;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D7;
							end
						end
			STP	:	begin
							TX <= 1'b1;	//Stop Bit
							if(count == 3'd7) begin
								count <= 3'd0;
								tx_ns <= DONE;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= STP;
							end
						end
		 DONE :	begin
							TX <= 1'b1;
							count <= 3'd0;
							tx_ns <= IDLE;
						end
			default :	begin
									TX <= 1'b1;
									count <= 3'd0;
									tx_ns <= IDLE;
								end 
		endcase
	end
end

always @(tx_ps) begin
	case(tx_ps)
		DONE : TX_DONE = 1'b1;
		default : TX_DONE = 1'b0;
	endcase
end

endmodule
