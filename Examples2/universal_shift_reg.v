module universal_shift_reg #(parameter n=4)
(	input clk,rst,wrb,
	input [2:0]sel,
	input sin,[n-1:0]pin,data,
	output reg sout,[n-1:0]pout);

reg [n-1:0]d;

always @(posedge clk, negedge rst)
begin
	if (!rst)
	begin
		sout <= 1'b0;
		pout <= {n{1'b0}};
		d <= {n{1'b0}};
	end
	else if (!wrb)
		d <= data;
	else
	begin
		case(sel[2:1])
			2'b00 :	begin
						d <= {d[n-2:0],sin}
						if(sel[0])
						begin
							pout <= d;
							sout <= 1'b0;
						end
						else
						begin
							sout <= d[n-1];
							pout <= {n{1'b0}};
						end
					end
			2'b01 :	begin
						if(sel[0])
						begin
							d <= pin;
							pout <= d;
							sout <= 1'b0;
						end
						else
						begin
							d <= {d[n-2:0],1'b0};
							sout <= d[n-1];
							pout <= {n{1'b0}};
						end
					end
			2'b10 :	begin
						if(sel[0])
						begin
							pout <= d;
							sout <= 1'b0;
						end
						else
						begin
							sout <= d[n-1];
							pout <= {n{1'b0}};
						end
					end
			2'b11 :	begin
						d <= {d[n-2:0],sin}
						if(sel[0])
						begin
							pout <= d;
							sout <= 1'b0;
						end
						else
						begin
							sout <= d[n-1];
							pout <= {n{1'b0}};
						end
					end
		endcase
	end
end

endmodule 