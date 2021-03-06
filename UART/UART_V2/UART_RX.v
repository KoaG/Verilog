module UART_RX(
	input SCLK,SCLR,
	input [2:0]UMODE,
	input [1:0]SMODE,
	input [4:0]BMODE,
	input RX,
	output reg RX_ERR,
	output reg [8:0]RX_DATA
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
					 DONE = 4'b1101;	//CHECK PARITY

localparam STP_1B  = 2'b00,
					 STP_15B = 2'b01,
					 STP_2B  = 2'b10;

reg [3:0]rx_ps,rx_ns;

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
			rx_ps <= STR;
	else if(BCLK) begin/*
			rx_ps <= rx_ns;
end

always @(posedge BCLK) begin*/
		//if(BCLK) begin
		case(rx_ns)
			STR	:	begin
							DATA <= 8'd0;
							RX_ERR <= 1'b0;
							if(count == MAX) begin
								count <= 5'd0;
								if(|{samples>>SHIFT} == 1'b0) begin
									rx_ns <= D0;
									samples <= {5'd0,RX};
								end	else begin
									rx_ns <= STR;
									samples <= {5'd0,RX};
								end
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= STR;
							end
						end
			 D0	:	begin
							RX_ERR <= 1'b0;
							if(count == MAX) begin
								count <= 5'd0;
								DATA <= {|{samples>>SHIFT},DATA[8:1]};
								rx_ns <= D1;
								samples <= {5'd0,RX};
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= D0;
							end
						end
			 D1	:	begin
							RX_ERR <= 1'b0;
							if(count == MAX) begin
								count <= 5'd0;
								DATA <= {|{samples>>SHIFT},DATA[8:1]};
								rx_ns <= D2;
								samples <= {5'd0,RX};
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= D1;
							end
						end
			 D2	:	begin
							RX_ERR <= 1'b0;
							if(count == MAX) begin
								count <= 5'd0;
								DATA <= {|{samples>>SHIFT},DATA[8:1]};
								rx_ns <= D3;
								samples <= {5'd0,RX};
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= D2;
							end
						end
			 D3	:	begin
							RX_ERR <= 1'b0;
							if(count == MAX) begin
								count <= 5'd0;
								DATA <= {|{samples>>SHIFT},DATA[8:1]};
								rx_ns <= D4;
								samples <= {5'd0,RX};
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= D3;
							end
						end
			 D4	:	begin
							RX_ERR <= 1'b0;
							if(count == MAX) begin
								count <= 5'd0;
								DATA <= {|{samples>>SHIFT},DATA[8:1]};
								samples <= {5'd0,RX};
								if(UMODE == D5P0)	rx_ns <= STP1;
								else if(UMODE == D5P1) rx_ns <= PAR;
								else	rx_ns <= D5;
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= D4;
							end
						end
			 D5	:	begin
							RX_ERR <= 1'b0;
							if(count == MAX) begin
								count <= 5'd0;
								DATA <= {|{samples>>SHIFT},DATA[8:1]};
								samples <= {5'd0,RX};
								if(UMODE == D6P0)	rx_ns <= STP1;
								else if(UMODE == D6P1) rx_ns <= PAR;
								else	rx_ns <= D6;
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= D5;
							end
						end
			 D6	:	begin
							RX_ERR <= 1'b0;
							if(count == MAX) begin
								count <= 5'd0;
								DATA <= {|{samples>>SHIFT},DATA[8:1]};
								samples <= {5'd0,RX};
								if(UMODE == D7P0)	rx_ns <= STP1;
								else if(UMODE == D7P1) rx_ns <= PAR;
								else	rx_ns <= D7;
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= D6;
							end
						end
			 D7	:	begin
							RX_ERR <= 1'b0;
							if(count == MAX) begin
								count <= 5'd0;
								DATA <= {|{samples>>SHIFT},DATA[8:1]};
								samples <= {5'd0,RX};
								if(UMODE == D8P0)	rx_ns <= STP1;
								else if(UMODE == D8P1) rx_ns <= PAR;
								else	rx_ns <= STP1;
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= D7;
							end
						end
			PAR	: begin
							RX_ERR <= 1'b0;
							if(count == MAX) begin
								count <= 5'd0;
								DATA <= {|{samples>>SHIFT},DATA[8:1]};
								rx_ns <= STP1;
								samples <= {5'd0,RX};
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= PAR;
							end							
						end
		 STP1 : begin
							DATA <= DATA;
							if(count == MAX) begin
								count <= 5'd0;
								if(|{samples>>SHIFT} == 1'b1) begin					
									samples <= {5'd0,RX};
									RX_ERR <= 1'b0;		
									case(SMODE)
										STP_15B : rx_ns <= STP5;
										STP_2B  : rx_ns <= STP2;
										default : rx_ns <= DONE;
									endcase
								end else begin
									rx_ns <= DONE;																
									samples <= {5'd0,RX};
									RX_ERR <= 1'b1;
								end
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= STP1;
							end
						end
		 STP5 : begin
							DATA <= DATA;
							if(count == {1'b0,MAX[4:1]}) begin
								count <= 5'd0;
								if(|{samples>>SHIFT} == 1'b1) begin					
									samples <= {5'd0,RX};
									RX_ERR <= 1'b0;		
									rx_ns <= DONE;
								end else begin
									rx_ns <= DONE;																
									samples <= {5'd0,RX};
									RX_ERR <= 1'b1;
								end
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= STP5;
							end
						end
		 STP2 : begin
							DATA <= DATA;
							if(count == MAX) begin
								count <= 5'd0;
								if(|{samples>>SHIFT} == 1'b1) begin
									samples <= {5'd0,RX};
									RX_ERR <= 1'b0;		
									rx_ns <= DONE;
								end else begin
									rx_ns <= DONE;																
									samples <= {5'd0,RX};
									RX_ERR <= 1'b1;
								end
							end else begin
								count <= count + 1'b1;
								samples <= samples + RX;
								rx_ns <= STP2;
							end
						end
		 DONE :	begin
							if(UMODE[0] == 1'b1) begin
								if(^DATA[7:0] == DATA[8])
									RX_ERR <= 1'b0;
								else
									RX_ERR <= 1'b1;
							end
							samples <= {5'd0,RX};
							count <= 3'd0;
							DATA <= DATA;
							rx_ns <= STR;
						end
			default :	begin
									samples <= 8'd0;
									count <= 3'd0;
									DATA <= 8'd0;
									rx_ns <= STR;
									RX_ERR <= 1'b0;
								end 
		endcase
	end
end

always @(rx_ps) begin
	case(rx_ps)
		STP1 :	RX_DATA = DATA;
		STP5 :	RX_DATA = DATA; 
		STP2 :	RX_DATA = DATA;
		DONE :	RX_DATA = DATA;
		default : RX_DATA = 8'd0;
	endcase
end

endmodule
 