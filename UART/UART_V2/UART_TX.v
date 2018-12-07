module UART_TX(
	input SCLK,SCLR,
	input [2:0]UMODE,
	input [1:0]SMODE,
	input [4:0]BMODE,
	input TX_EN,
	input [7:0]TX_DATA,
	output reg TX,TX_DONE
	);

wire [1:0]SAMP;
assign SAMP = BMODE[1:0];

localparam D5P0 = 3'b000,	//5N0
					 D5P1 = 3'b001,	//5N1
					 D6P0 = 3'b010,	//6N0
					 D6P1 = 3'b011,	//6N1
					 D7P0 = 3'b100,	//7N0
					 D7P1 = 3'b101,	//7N1
					 D8P0 = 3'b110,	//8N0
					 D8P1 = 3'b111;	//8N1

wire BCLK;
baud_gen bgen(
	.SCLK(SCLK),
	.SCLR(SCLR),
	.BMODE(BMODE),
	.BAUD_CLK(BCLK)
	);

localparam STR  = 4'b0000,	//WAIT FOR START BIT
						D0  = 4'b0001,	//STORE D[0]
						D1  = 4'b0010,
						D2  = 4'b0011,
						D3  = 4'b0100,
						D4  = 4'b0101,
						D5  = 4'b0110,
						D6  = 4'b0111,
						D7  = 4'b1000,	//STORE D[7]
					 STP1 = 4'b1001,	//1 CYCLE STOP BIT
					 STP5 = 4'b1010,	//.5 CYCLE STOP BIT
					 STP2 = 4'b1011,	//1 CYCLE STOP BIT
					 PAR  = 4'b1100,	//STORE PARITY BIT AT D[8]
					 DONE = 4'b1101,
					 IDLE = 4'b1110;	//CHECK PARITY

localparam STP_1B  = 2'b00,
					 STP_15B = 2'b01,
					 STP_2B  = 2'b10;

reg [3:0]tx_ps,tx_ns;

reg [4:0]MAX;
reg [2:0]SHIFT;
always @(SAMP) begin
	MAX = 5'd7;
	SHIFT = 3'd2;
	case(SAMP)
		2'b00 : {MAX,SHIFT} = {5'd3 ,3'd1};
		2'b01 : {MAX,SHIFT} = {5'd7 ,3'd2};
		2'b10 : {MAX,SHIFT} = {5'd15,3'd3};
		2'b11 : {MAX,SHIFT} = {5'd31,3'd4};
	endcase
end

reg [5:0]samples;
reg [4:0]count;
reg [8:0]DATA;

always @(posedge SCLK) begin
	if(SCLR)
			tx_ps <= STR;
	else if(BCLK) begin/*
			rx_ps <= rx_ns;
end

always @(posedge BCLK) begin*/
		//if(BCLK) begin
		case(tx_ns)
			IDLE: begin
							count <= 5'd0;
							TX <= 1'b1;							
							if(TX_EN) tx_ns <= STR;
							else tx_ns <= IDLE;
						end
			STR	:	begin
							TX <= 1'b0; //Start Bit
							DATA <= TX_DATA; //Storing DATA for TX
							if(count == MAX) begin
								count <= 5'd0;
								tx_ns <= D0;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= STR;
							end
						end
			 D0	:	begin
							TX <= DATA[0];	//LSB First
							if(count == MAX) begin
								count <= 5'd0;
								tx_ns <= D1;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D0;
							end
						end
			 D1	:	begin
							TX <= DATA[1];	
							if(count == MAX) begin
								count <= 5'd0;
								tx_ns <= D2;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D1;
							end	
						end
			 D2	:	begin
							TX <= DATA[2];	
							if(count == MAX) begin
								count <= 5'd0;
								tx_ns <= D3;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D2;
							end
						end
			 D3	:	begin
							TX <= DATA[3];	
							if(count == MAX) begin
								count <= 5'd0;
								tx_ns <= D4;	
							end else begin
								count <= count + 1'b1;
								tx_ns <= D3;
							end
						end
			 D4	:	begin
							TX <= DATA[4];	
							if(count == MAX) begin
								count <= 5'd0;
								if(UMODE == D5P0)	tx_ns <= STP1;
								else if(UMODE == D5P1) tx_ns <= PAR;
								else	tx_ns <= D5;
							end else begin
								count <= count + 1'b1;
								tx_ns <= D4;
							end
						end
			 D5	:	begin
							TX <= DATA[5];	
							if(count == MAX) begin
								count <= 5'd0;
								if(UMODE == D6P0)	tx_ns <= STP1;
								else if(UMODE == D6P1) tx_ns <= PAR;
								else	tx_ns <= D6;
							end else begin
								count <= count + 1'b1;
								tx_ns <= D5;
							end	
						end
			 D6	:	begin
							TX <= DATA[6];	
							if(count == MAX) begin
								count <= 5'd0;
								if(UMODE == D7P0)	tx_ns <= STP1;
								else if(UMODE == D7P1) tx_ns <= PAR;
								else	tx_ns <= D7;
							end else begin
								count <= count + 1'b1;
								tx_ns <= D6;
							end
						end
			 D7	:	begin
							TX <= DATA[7];	
							if(count == MAX) begin
								count <= 5'd0;
								if(UMODE == D8P0)	tx_ns <= STP1;
								else if(UMODE == D8P1) tx_ns <= PAR;
								else	tx_ns <= STP1;
							end else begin
								count <= count + 1'b1;
								tx_ns <= D7;
							end
						end
			PAR	: begin
							TX <= ^DATA;	
							if(count == MAX) begin
								count <= 5'd0;
								tx_ns <= STP1;
							end else begin
								count <= count + 1'b1;
								tx_ns <= D4;
							end						
						end
		 STP1 : begin
							TX <= 1'b1;	//Stop Bit
							if(count == MAX) begin
								count <= 5'd0;
								case(SMODE)
									STP_15B : tx_ns <= STP5;
									STP_2B  : tx_ns <= STP2;
									default : tx_ns <= DONE;
								endcase
							end else begin
								count <= count + 1'b1;
								tx_ns <= STP1;
							end
						end
		 STP5 : begin
							TX <= 1'b1;	//Stop Bit
							if(count == {1'b0,MAX[4:1]}) begin
								count <= 5'd0;
								tx_ns <= DONE;
							end else begin
								count <= count + 1'b1;
								tx_ns <= STP5;
							end
						end
		 STP2 : begin
							TX <= 1'b1;	//Stop Bit
							if(count == MAX) begin
								count <= 5'd0;
								tx_ns <= DONE;
							end else begin
								count <= count + 1'b1;
								tx_ns <= STP2;
							end
						end
		 DONE :	begin
							TX <= 1'b1;
							count <= 5'd0;
							tx_ns <= IDLE;
						end
			default :	begin
							TX <= 1'b1;
							count <= 5'd0;
							tx_ns <= IDLE;
								end 
		endcase
	end
end

always @(tx_ns) begin
	case(tx_ns)
		DONE : TX_DONE = 1'b1;
		default : TX_DONE = 1'b0;
	endcase
end

endmodule
 
