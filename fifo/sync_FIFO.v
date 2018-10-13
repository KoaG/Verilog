module sync_FIFO (
	input clk,rst,we,re,
	input [7:0]din,
	output empty,full,rd_err,wr_err,
	output reg [7:0]dout
	);

reg [7:0]fifo[0:7];
reg [3:0]data_count;
reg [2:0]rd_ptr,wr_ptr;
reg [1:0]flag,err;	//flag[1] = full, flag[0] = empty
							//err[1] = rd_err, err[0] = wr_err

assign {full,empty} = flag;
assign {rd_err,wr_err} = err;
							
always @(posedge clk) begin
	
	if(rst) begin
		rd_ptr <= 1'b0;
		wr_ptr <= 1'b0;
		data_count <= 4'd0;
		dout <= 8'd0;
		err <= 2'b00;
	end
	else begin
		if(flag == 2'b00) begin		//partially filled fifo
			case({we,re})
				2'b00 : 	begin			//no-op
							dout <= 8'd0;
							err <= 2'b00;
							rd_ptr <= rd_ptr;
							wr_ptr <= wr_ptr;
							data_count <= data_count;
							end
				2'b01 :	begin			//read only
							dout <= fifo[rd_ptr];
							rd_ptr <= rd_ptr + 1'b1;
							wr_ptr <= wr_ptr;
							err <= 2'b00;
							data_count <= data_count - 1'b1;
							end
				2'b10 :	begin			//write only
							fifo[wr_ptr] <= din;
							wr_ptr <= wr_ptr + 1'b1;
							rd_ptr <= rd_ptr;
							err <= 2'b00;
							data_count <= data_count + 1'b1;
							end
				2'b11 :	begin			//read and write
							fifo[wr_ptr] <= din;
							dout <= fifo[rd_ptr];
							wr_ptr <= wr_ptr + 1'b1;
							rd_ptr <= rd_ptr + 1'b1;
							err <= 2'b00;
							data_count <= data_count;
							end							
			endcase
		end
		else if(flag == 2'b01) begin		//empty fifo
			case({we,re})
				2'b00 : 	begin			//no-op
							dout <= 8'd0;
							err <= 2'b00;
							rd_ptr <= rd_ptr;
							wr_ptr <= wr_ptr;
							data_count <= data_count;
							end
				2'b01 :	begin			//read only
							dout <= 8'd0;
							rd_ptr <= rd_ptr;
							wr_ptr <= wr_ptr;
							err <= 2'b10;		//read error
							data_count <= data_count;
							end
				2'b10 :	begin			//write only
							fifo[wr_ptr] <= din;
							wr_ptr <= wr_ptr + 1'b1;
							rd_ptr <= rd_ptr;
							err <= 2'b00;
							data_count <= data_count + 1'b1;
							end
				2'b11 :	begin			//read and write
							dout <= din;		//directly output data in
							wr_ptr <= wr_ptr;
							rd_ptr <= rd_ptr;
							err <= 2'b00;
							data_count <= data_count;
							end							
			endcase			
		end
		else if (flag == 2'b10) begin		//full fifo
			case({we,re})
				2'b00 : 	begin			//no-op
							dout <= 8'd0;
							err <= 2'b00;
							rd_ptr <= rd_ptr;
							wr_ptr <= wr_ptr;
							data_count <= data_count;
							end
				2'b01 :	begin			//read only
							dout <= fifo[rd_ptr];
							rd_ptr <= rd_ptr + 1'b1;
							wr_ptr <= wr_ptr;
							err <= 2'b00;
							data_count <= data_count - 1'b1;
							end
				2'b10 :	begin			//write only
							dout <= 8'd0;
							wr_ptr <= wr_ptr;
							rd_ptr <= rd_ptr;
							err <= 2'b01;		//write error
							data_count <= data_count;
							end
				2'b11 :	begin			//read and write
							fifo[wr_ptr] <= din;
							dout <= fifo[rd_ptr];
							wr_ptr <= wr_ptr + 1'b1;
							rd_ptr <= rd_ptr + 1'b1;
							err <= 2'b00;
							data_count <= data_count;
							end							
			endcase		
		end
		else begin
			dout <= 8'd0;
			rd_ptr <= rd_ptr;
			wr_ptr <= wr_ptr;
			data_count <= data_count;
			err <= 2'b11;
		end
	end
end

always @(data_count) begin
	flag = {(data_count == 4'd8),(data_count == 4'd0)};
end

endmodule 
