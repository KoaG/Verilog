module upcounter_asyn
(	input clk,rst,
	output [3:0]count);
/*
tff tff0 (.clk(clk),.rst(rst),.t(1'b1),.q(count[0]));
tff tff1 (.clk(count[0]),.rst(rst),.t(1'b1),.q(count[1]));
tff tff2 (.clk(count[1]),.rst(rst),.t(1'b1),.q(count[2]));
tff tff3 (.clk(count[2]),.rst(rst),.t(1'b1),.q(count[3]));
*/
wire [3:0]temp;
DFF dff0 (.clk(clk),.rst(rst),.d(~temp[0]),.q(temp[0]));
DFF dff1 (.clk(~temp[0]),.rst(rst),.d(~temp[1]),.q(temp[1]));
DFF dff2 (.clk(~temp[1]),.rst(rst),.d(~temp[2]),.q(temp[2]));
DFF dff3 (.clk(~temp[2]),.rst(rst),.d(~temp[3]),.q(temp[3]));

assign count = temp;
endmodule 