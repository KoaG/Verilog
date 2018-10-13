module usr #(parameter n=4)
(	input clk,rst,ld,
	input [2:0]sel,
	input [n-1:0]pin,			//sin = pin[n-1]
	output reg [n-1:0]pout);	//sout = pout[0]

parameter siso = 3'b000,
		  sipo = 3'b001,
		  piso = 3'b010,
		  pipo = 3'b011,
		  lso  = 3'b100,
		  rso  = 3'b101,
		  rol  = 3'b110,
		  ror  = 3'b111;

always @(posedge clk, negedge rst)
begin
	if (!rst)
		pout <= {n{1'b0}};
	else
	begin
		case(sel)
			siso : 	begin
						pout <= {pin[n-1],pout[n-1:1]};		//sin = pin[n-1] & sout = pout[0]
					end
			sipo :	begin
						pout <= {pin[n-1],pout[n-1:1]};		//sin = pin[n-1]] & sout = pout[0]
					end
			piso :	begin
						if(ld)
							pout <= pin;
						else
							pout <= {1'b0,pout[n-1:1]};		//sout = pout[0]
					end
			pipo :	begin
						pout <= pin;
					end
			lso  :	begin
						if (ld)
							pout <= pin;
						else
							pout <= {pout[n-2:0],1'b0};
					end
			rso  :	begin
						if (ld)
							pout <= pin;
						else	
							pout <= {1'b0,pout[n-1:1]};
					end
			rol  :	begin
						if (ld)
							pout <= pin;
						else
							pout <= {pout[n-2:0],pout[n-1]};
					end
			ror  :	begin
						if (ld)
							pout <= pin;
						else
							pout <= {pout[0],pout[n-1:1]};
					end
		endcase
	end
end

endmodule 