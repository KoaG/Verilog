module UART_RX(
	input SCLK,
	input SCLR,[1:0]MODE,
	input RX,
	output reg RX_ERR,
	output reg [7:0]RX_DATA
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
					DONE = 4'b1010;

reg [3:0]rx_ps,rx_ns;
reg [7:0]samples;
reg [2:0]count;
reg [7:0]DATA;

always @(posedge SCLK) begin
	if(SCLR)
			rx_ps <= STR;
	else 
			rx_ps <= rx_ns;
end

always @(rx_ps,RX,BCLK) begin
	if(BCLK) begin
		case(rx_ps)
			STR	:	begin
							DATA <= 8'd0;
							RX_ERR <= 1'b0;
							if(count == 3'd7) begin
								count <= 3'd0;
								if(&samples[5:2] == 1'b0) begin
									rx_ns <= D0;
									samples <= 8'd0;
								end	else begin
									rx_ns <= STR;
									samples <= 8'd0;
								end
							end else begin
								count <= count + 1'b1;
								samples <= {RX,samples[7:1]};
								rx_ns <= STR;
							end
						end
			 D0	:	begin
							RX_ERR <= 1'b0;
							if(count == 3'd7) begin
								count <= 3'd0;
								DATA <= {&samples[5:2],DATA[7:1]};
								rx_ns <= D1;
								samples <= 8'd0;
							end else begin
								count <= count + 1'b1;
								samples <= {RX,samples[7:1]};
								rx_ns <= D0;
							end
						end
			 D1	:	begin
							RX_ERR <= 1'b0;
							if(count == 3'd7) begin
								count <= 3'd0;
								DATA <= {&samples[5:2],DATA[7:1]};
								rx_ns <= D2;
								samples <= 8'd0;
							end else begin
								count <= count + 1'b1;
								samples <= {RX,samples[7:1]};
								rx_ns <= D1;
							end
						end
			 D2	:	begin
							RX_ERR <= 1'b0;
							if(count == 3'd7) begin
								count <= 3'd0;
								DATA <= {&samples[5:2],DATA[7:1]};
								rx_ns <= D3;
								samples <= 8'd0;
							end else begin
								count <= count + 1'b1;
								samples <= {RX,samples[7:1]};
								rx_ns <= D2;
							end
						end
			 D3	:	begin
							RX_ERR <= 1'b0;
							if(count == 3'd7) begin
								count <= 3'd0;
								DATA <= {&samples[5:2],DATA[7:1]};
								rx_ns <= D4;
								samples <= 8'd0;
							end else begin
								count <= count + 1'b1;
								samples <= {RX,samples[7:1]};
								rx_ns <= D3;
							end
						end
			 D4	:	begin
							RX_ERR <= 1'b0;
							if(count == 3'd7) begin
								count <= 3'd0;
								DATA <= {&samples[5:2],DATA[7:1]};
								rx_ns <= D5;
								samples <= 8'd0;
							end else begin
								count <= count + 1'b1;
								samples <= {RX,samples[7:1]};
								rx_ns <= D4;
							end
						end
			 D5	:	begin
							RX_ERR <= 1'b0;
							if(count == 3'd7) begin
								count <= 3'd0;
								DATA <= {&samples[5:2],DATA[7:1]};
								rx_ns <= D6;
								samples <= 8'd0;
							end else begin
								count <= count + 1'b1;
								samples <= {RX,samples[7:1]};
								rx_ns <= D5;
							end
						end
			 D6	:	begin
							RX_ERR <= 1'b0;
							if(count == 3'd7) begin
								count <= 3'd0;
								DATA <= {&samples[5:2],DATA[7:1]};
								rx_ns <= D7;
								samples <= 8'd0;
							end else begin
								count <= count + 1'b1;
								samples <= {RX,samples[7:1]};
								rx_ns <= D6;
							end
						end
			 D7	:	begin
							RX_ERR <= 1'b0;
							if(count == 3'd7) begin
								count <= 3'd0;
								DATA <= {&samples[5:2],DATA[7:1]};
								rx_ns <= STP;
								samples <= 8'd0;
							end else begin
								count <= count + 1'b1;
								samples <= {RX,samples[7:1]};
								rx_ns <= D7;
							end
						end
			STP	:	begin
							if(count == 3'd7) begin
								count <= 3'd0;
								if(&samples[5:2] == 1'b1) begin
									rx_ns <= DONE;
									samples <= 8'd0;
									RX_ERR <= 1'b0;		
								end else begin
									rx_ns <= DONE;																
									samples <= 8'd0;
									RX_ERR <= 1'b1;
								end
							end else begin
								count <= count + 1'b1;
								samples <= {RX,samples[7:1]};
								rx_ns <= STP;
							end
						end
		 DONE :	begin
							samples <= 8'd0;
							count <= 3'd0;
							DATA <= 8'd0;
							rx_ns <= STR;
							RX_ERR <= 1'b0;
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
		DONE :	RX_DATA = DATA;
		default : RX_DATA = 8'd0;
	endcase
end

endmodule
