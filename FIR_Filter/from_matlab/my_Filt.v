`timescale 1 ns/ 1 ns
module my_Filt(
    input clk,rst,ce,
    input signed [15:0]x,
    output signed [32:0]y
);

  parameter signed [15:0] coeff1 = 16'b0000010001001100; //sfix16_En16
  parameter signed [15:0] coeff2 = 16'b0000110100101011; //sfix16_En16
  parameter signed [15:0] coeff3 = 16'b1111000111101101; //sfix16_En16
  parameter signed [15:0] coeff4 = 16'b1100001000110100; //sfix16_En16
  parameter signed [15:0] coeff5 = 16'b0000101101000011; //sfix16_En16
  parameter signed [15:0] coeff6 = 16'b0101111011011110; //sfix16_En16
  parameter signed [15:0] coeff7 = 16'b0000101101000011; //sfix16_En16
  parameter signed [15:0] coeff8 = 16'b1100001000110100; //sfix16_En16
  parameter signed [15:0] coeff9 = 16'b1111000111101101; //sfix16_En16
  parameter signed [15:0] coeff10 = 16'b0000110100101011; //sfix16_En16
  parameter signed [15:0] coeff11 = 16'b0000010001001100; //sfix16_En16

integer i;

reg signed [15:0]x_n[1:11];

reg signed [16:0]add_x[0:5];
reg signed [32:0]mult_x[0:5];
reg signed [33:0]add_x1[0:2];
reg signed [34:0]add_x2[0:1];
reg signed [34:0]add_x3;

always @(posedge clk ) begin
    if(rst) begin
        for ( i=1 ; i<=11 ; i=i+1 ) begin
            x_n[i] <= 16'd0;  
        end
    end else if(ce) begin
        x_n[1] <= x;
        x_n[2] <= x_n[1];
        x_n[3] <= x_n[2];
        x_n[4] <= x_n[3];
        x_n[5] <= x_n[4];
        x_n[6] <= x_n[5];
        x_n[7] <= x_n[6];
        x_n[8] <= x_n[7];
        x_n[9] <= x_n[8];
        x_n[10] <= x_n[9];
        x_n[11] <= x_n[10];        
        //Addition
        add_x[0] <= x + x_n[10];
        add_x[1] <= x_n[1] + x_n[9];
        add_x[2] <= x_n[2] + x_n[8];
        add_x[3] <= x_n[3] + x_n[7];
        add_x[4] <= x_n[4] + x_n[6];
        add_x[5] <= x_n[5];
        //Multiplication
        mult_x[0] <= add_x[0] * coeff1;
        mult_x[1] <= add_x[1] * coeff2;
        mult_x[2] <= add_x[2] * coeff3;
        mult_x[3] <= add_x[3] * coeff4;
        mult_x[4] <= add_x[4] * coeff5;
        mult_x[5] <= add_x[5] * coeff6;
        //Additon
        add_x1[0] <= mult_x[0] + mult_x[1];
        add_x1[1] <= mult_x[2] + mult_x[3];
        add_x1[2] <= mult_x[4] + mult_x[5];
        //Addition
        add_x2[0] <= add_x1[0] + add_x1[1];
        add_x2[1] <= add_x1[2];
        //Addition
        add_x3 <= add_x2[0] + add_x2[1];
        
    end
end
//Assign

    assign y =add_x3;


endmodule