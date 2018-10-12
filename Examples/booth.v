module booth #(parameter Nb=2, n=2**Nb, m=2*n)
(	input clk,rst,ld,[n-1:0]im,iq,
	output pd,[2*n-1:0]p);

reg [n-1:0]A,Q,M;
reg q0;
reg [Nb:0]count;
wire [n-1:0]sum,diff;

always @(posedge clk) begin
	if(!rst) begin
		A <= {n{1'b0}};
		Q <= {n{1'b0}};
		M <= {n{1'b0}};
		q0 <= 1'b0;
		count <= {(Nb+1){1'b0}};
	end
	else if(ld) begin
		A <= {n{1'b0}};
		Q <= iq;
		M <= im;
		q0 <= 1'b0;
		count <= {(Nb+1){1'b1}};
	end
	else begin
		case({Q[0],q0})
			2'b01 : {A,Q,q0} <= {sum[n-1],sum,Q};
			2'b10 : {A,Q,q0} <= {diff[n-1],diff,Q};
			default : {A,Q,q0} <= {A[n-1],A,Q};
		endcase
		count <= count + 1'b1;
	end
end

assign sum = A + M,
		diff = A - M,
		p = {A,Q},
		pd = (count == {1'b0,{Nb{1'b1}}});

endmodule 