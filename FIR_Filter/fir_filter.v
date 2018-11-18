module fir_filter #(parameter DATA_WIDTH = 16)(
    input signed [DATA_WIDTH-1:0]xn,
    input clk,rst,start,
    //output ready,
    output signed [2*DATA_WIDTH+1:0]yn
);

parameter TAPS = 11;
reg [DATA_WIDTH-1:0]b[0:(TAPS-1)/2];
initial begin
    b[0] =  1;
    b[1] =  2;
    b[2] =  3;
    b[3] =  4;
    b[4] =  5;
    b[5] =  6;  
end
/*
parameter b0 = -0.028392725997905,
    b1 =  0.018518774159293,
    b2 =  0.115448730268491,
    b3 = -0.198599034086924,
    b4 = -0.101635729426832,
    b5 =  0.360815024068615;  
*/


wire [DATA_WIDTH-1:0]Xin[0:TAPS-1];
assign Xin[0] = xn;
//generate begin:TAPs
    genvar i0;
    dff #(DATA_WIDTH) T1_0(.d(Xin[0]),.clk(clk),.clr(rst),.q(Xin[1]));
    for ( i0=1 ; i0<TAPS-1 ; i0=i0+1 ) begin:T1
        dff #(DATA_WIDTH) d0(.d(Xin[i0]),.clk(clk),.clr(rst),.q(Xin[i0+1]));
    end
//end



wire [DATA_WIDTH:0]ADD_X[0:(TAPS-1)/2];
wire [DATA_WIDTH:0]reg_ADD_X[0:(TAPS-1)/2];
//generate begin:A0s
    genvar i;
    for ( i=0 ; i<((TAPS+1)/2)-1 ; i=i+1 ) begin:A0
        assign ADD_X[i] = Xin[i] + Xin[TAPS-1-i];
        dff #(DATA_WIDTH) d1(.d(ADD_X[i]),.clk(clk),.clr(rst),.q(reg_ADD_X[i]));
    end
    assign ADD_X[5] = Xin[5];
    dff #(DATA_WIDTH) A0_d1(.d(ADD_X[5]),.clk(clk),.clr(rst),.q(reg_ADD_X[5]));
//end



wire [2*DATA_WIDTH+1:0]MULT_XB[0:(TAPS-1)/1];
wire [2*DATA_WIDTH+1:0]reg_MULT_XB[0:(TAPS-1)/1];
//generate begin:M0s
    genvar j;
    for ( j=0 ; j<(TAPS+1)/2 ; j=j+1 ) begin:M1
        assign MULT_XB[j] = reg_ADD_X[j]*b[j];
        dff #(2*DATA_WIDTH+2) d2(.d(MULT_XB[j]),.clk(clk),.clr(rst),.q(reg_MULT_XB[j]));
    end
//end



wire [2*DATA_WIDTH+1:0]ADD_Y[0:(TAPS-1)/4];
wire [2*DATA_WIDTH+1:0]reg_ADD_Y[0:(TAPS-1)/4];
//generate begin:A2
    genvar k;
    for ( k=0 ; k<(TAPS+1)/4 ; k=k+1 ) begin:A1
        assign ADD_Y[k] = reg_MULT_XB[2*k] + reg_MULT_XB[2*k+1];
        dff #(2*DATA_WIDTH+2) d3(.d(ADD_Y[k]),.clk(clk),.clr(rst),.q(reg_ADD_Y[k]));
    end
//end

assign yn = reg_ADD_Y[0] + reg_ADD_Y[1] + reg_ADD_Y[2];

endmodule