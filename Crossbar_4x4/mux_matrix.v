module mux_matrix(
    input [7:0]ip0,ip1,ip2,ip3,
    input [3:0]sel0,sel1,sel2,sel3,
    output [9:0]sd0,sd1,sd2,sd3
);

wire [9:0]gnd;
wire [9:0]s00,s01,s02;
wire [9:0]s10,s11,s12;
wire [9:0]s20,s21,s22;
wire [9:0]s30,s31,s32;
assign gnd = 10'd0;

//column 1
mux mux00(.ip0(gnd),.ip1({2'b00,ip0}),.sel(sel0[0]),.y(s00));
mux mux01(.ip0(gnd),.ip1({2'b00,ip0}),.sel(sel0[1]),.y(s10));
mux mux02(.ip0(gnd),.ip1({2'b00,ip0}),.sel(sel0[2]),.y(s20));
mux mux03(.ip0(gnd),.ip1({2'b00,ip0}),.sel(sel0[3]),.y(s30));
//column 2
mux mux10(.ip0(s00),.ip1({2'b01,ip1}),.sel(sel1[0]),.y(s01));
mux mux11(.ip0(s10),.ip1({2'b01,ip1}),.sel(sel1[1]),.y(s11));
mux mux12(.ip0(s20),.ip1({2'b01,ip1}),.sel(sel1[2]),.y(s21));
mux mux13(.ip0(s30),.ip1({2'b01,ip1}),.sel(sel1[3]),.y(s31));
//column 3
mux mux20(.ip0(s01),.ip1({2'b10,ip2}),.sel(sel2[0]),.y(s02));
mux mux21(.ip0(s11),.ip1({2'b10,ip2}),.sel(sel2[1]),.y(s12));
mux mux22(.ip0(s21),.ip1({2'b10,ip2}),.sel(sel2[2]),.y(s22));
mux mux23(.ip0(s31),.ip1({2'b10,ip2}),.sel(sel2[3]),.y(s32));
//column 3
mux mux30(.ip0(s02),.ip1({2'b11,ip3}),.sel(sel3[0]),.y(sd0));
mux mux31(.ip0(s12),.ip1({2'b11,ip3}),.sel(sel3[1]),.y(sd1));
mux mux32(.ip0(s22),.ip1({2'b11,ip3}),.sel(sel3[2]),.y(sd2));
mux mux33(.ip0(s32),.ip1({2'b11,ip3}),.sel(sel3[3]),.y(sd3));

endmodule