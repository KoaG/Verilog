module mux_fabric(
    input [7:0]ip0pld,ip1pld,ip2pld,ip3pld,
    input [1:0]ip0d,ip1d,ip2d,ip3d,
    input [1:0]ip0s,ip1s,ip2s,ip3s,
    input ip0v,ip1v,ip2v,ip3v,
    input [1:0]slot,
    input clr,
    output [14:0]os00,os01,os02,os03,
    output [14:0]os10,os11,os12,os13,
    output [14:0]os20,os21,os22,os23,
    output [14:0]os30,os31,os32,os33
  /*  output [1:0]ss00,ss01,ss02,ss03,
    output [1:0]ss10,ss11,ss12,ss13,
    output [1:0]ss20,ss21,ss22,ss23,
    output [1:0]ss30,ss31,ss32,ss33*/
);

wire [3:0]dp0,dp1,dp2,dp3;
dest_decoder dd0(.ip0d(ip0d),.ip1d(ip1d),.ip2d(ip2d),.ip3d(ip3d),.d0(dp0),.d1(dp1),.d2(dp2),.d3(dp3));

wire [3:0]en0,en1,en2,en3;
assign en0 = {4{ip0v}} & dp0;
assign en1 = {4{ip1v}} & dp1;
assign en2 = {4{ip2v}} & dp2;
assign en3 = {4{ip3v}} & dp3;

wire [10:0]s00,s01,s02,s03;
wire [10:0]s10,s11,s12,s13;
wire [10:0]s20,s21,s22,s23;
wire [10:0]s30,s31,s32,s33;

wire [3:0]sel00,sel01,sel02,sel03;
wire [3:0]sel10,sel11,sel12,sel13;
wire [3:0]sel20,sel21,sel22,sel23;
wire [3:0]sel30,sel31,sel32,sel33;

assign s00[10] = sel00[0] | sel01[0] | sel02[0] | sel03[0];
assign s01[10] = sel00[1] | sel01[1] | sel02[1] | sel03[1];
assign s02[10] = sel00[2] | sel01[2] | sel02[2] | sel03[2];
assign s03[10] = sel00[3] | sel01[3] | sel02[3] | sel03[3];

assign s10[10] = sel10[0] | sel11[0] | sel12[0] | sel13[0];
assign s11[10] = sel10[1] | sel11[1] | sel12[1] | sel13[1];
assign s12[10] = sel10[2] | sel11[2] | sel12[2] | sel13[2];
assign s13[10] = sel10[3] | sel11[3] | sel12[3] | sel13[3];

assign s20[10] = sel20[0] | sel21[0] | sel22[0] | sel23[0];
assign s21[10] = sel20[1] | sel21[1] | sel22[1] | sel23[1];
assign s22[10] = sel20[2] | sel21[2] | sel22[2] | sel23[2];
assign s23[10] = sel20[3] | sel21[3] | sel22[3] | sel23[3];

assign s30[10] = sel30[0] | sel31[0] | sel32[0] | sel33[0];
assign s31[10] = sel30[1] | sel31[1] | sel32[1] | sel33[1];
assign s32[10] = sel30[2] | sel31[2] | sel32[2] | sel33[2];
assign s33[10] = sel30[3] | sel31[3] | sel32[3] | sel33[3];

mux_sel_gen msg0(.ip0s(ip0s),.ip1s(ip1s),.ip2s(ip2s),.ip3s(ip3s),
                .en0(en0[0]),.en1(en1[0]),.en2(en2[0]),.en3(en3[0]),
                .sel0(sel00),.sel1(sel01),.sel2(sel02),.sel3(sel03));
mux_sel_gen msg1(.ip0s(ip0s),.ip1s(ip1s),.ip2s(ip2s),.ip3s(ip3s),
                .en0(en0[1]),.en1(en1[1]),.en2(en2[1]),.en3(en3[1]),
                .sel0(sel10),.sel1(sel11),.sel2(sel12),.sel3(sel13));
mux_sel_gen msg2(.ip0s(ip0s),.ip1s(ip1s),.ip2s(ip2s),.ip3s(ip3s),
                .en0(en0[2]),.en1(en1[2]),.en2(en2[2]),.en3(en3[2]),
                .sel0(sel20),.sel1(sel21),.sel2(sel22),.sel3(sel23));
mux_sel_gen msg3(.ip0s(ip0s),.ip1s(ip1s),.ip2s(ip2s),.ip3s(ip3s),
                .en0(en0[3]),.en1(en1[3]),.en2(en2[3]),.en3(en3[3]),
                .sel0(sel30),.sel1(sel31),.sel2(sel32),.sel3(sel33));

mux_matrix mm0(.ip0(ip0pld),.ip1(ip1pld),.ip2(ip2pld),.ip3(ip3pld),
                .sel0(sel00),.sel1(sel01),.sel2(sel02),.sel3(sel03),
                .sd0(s00[9:0]),.sd1(s01[9:0]),.sd2(s02[9:0]),.sd3(s03[9:0]));
mux_matrix mm1(.ip0(ip0pld),.ip1(ip1pld),.ip2(ip2pld),.ip3(ip3pld),
                .sel0(sel10),.sel1(sel11),.sel2(sel12),.sel3(sel13),
                .sd0(s10[9:0]),.sd1(s11[9:0]),.sd2(s12[9:0]),.sd3(s13[9:0]));
mux_matrix mm2(.ip0(ip0pld),.ip1(ip1pld),.ip2(ip2pld),.ip3(ip3pld),
                .sel0(sel20),.sel1(sel21),.sel2(sel22),.sel3(sel23),
                .sd0(s20[9:0]),.sd1(s21[9:0]),.sd2(s22[9:0]),.sd3(s23[9:0]));
mux_matrix mm3(.ip0(ip0pld),.ip1(ip1pld),.ip2(ip2pld),.ip3(ip3pld),
                .sel0(sel30),.sel1(sel31),.sel2(sel32),.sel3(sel33),
                .sd0(s30[9:0]),.sd1(s31[9:0]),.sd2(s32[9:0]),.sd3(s33[9:0]));
/*
prior_encoder pe00(.x({sel03[0],sel02[0],sel01[0],sel00[0]}),.y(ss00));
prior_encoder pe01(.x({sel03[1],sel02[1],sel01[1],sel00[1]}),.y(ss01));
prior_encoder pe02(.x({sel03[2],sel02[2],sel01[2],sel00[2]}),.y(ss02));
prior_encoder pe03(.x({sel03[3],sel02[3],sel01[3],sel00[3]}),.y(ss03));

prior_encoder pe10(.x({sel13[0],sel12[0],sel11[0],sel10[0]}),.y(ss10));
prior_encoder pe11(.x({sel13[1],sel12[1],sel11[1],sel10[1]}),.y(ss11));
prior_encoder pe12(.x({sel13[2],sel12[2],sel11[2],sel10[2]}),.y(ss12));
prior_encoder pe13(.x({sel13[3],sel12[3],sel11[3],sel10[3]}),.y(ss13));

prior_encoder pe20(.x({sel23[0],sel22[0],sel21[0],sel20[0]}),.y(ss20));
prior_encoder pe21(.x({sel23[1],sel22[1],sel21[1],sel20[1]}),.y(ss21));
prior_encoder pe22(.x({sel23[2],sel22[2],sel21[2],sel20[2]}),.y(ss22));
prior_encoder pe23(.x({sel23[3],sel22[3],sel21[3],sel20[3]}),.y(ss23));

prior_encoder pe30(.x({sel33[0],sel32[0],sel31[0],sel30[0]}),.y(ss30));
prior_encoder pe31(.x({sel33[1],sel32[1],sel31[1],sel30[1]}),.y(ss31));
prior_encoder pe32(.x({sel33[2],sel32[2],sel31[2],sel30[2]}),.y(ss32));
prior_encoder pe33(.x({sel33[3],sel32[3],sel31[3],sel30[3]}),.y(ss33));
*/
assign os00 = (clr) ? 15'd0 : 
                (s00[10]) ? {s00[10],1'b0,s00[9:8],1'b0,slot,s00[7:0]} : os00;
assign os01 = (clr) ? 15'd0 : 
                (s01[10]) ? {s01[10],1'b0,s01[9:8],1'b0,slot,s01[7:0]} : os01;
assign os02 = (clr) ? 15'd0 : 
                (s02[10]) ? {s02[10],1'b0,s02[9:8],1'b0,slot,s02[7:0]} : os02;
assign os03 = (clr) ? 15'd0 : 
                (s03[10]) ? {s03[10],1'b0,s03[9:8],1'b0,slot,s03[7:0]} : os03;

assign os10 = (clr) ? 15'd0 : 
                (s10[10]) ? {s10[10],1'b0,s10[9:8],1'b0,slot,s10[7:0]} : os10;
assign os11 = (clr) ? 15'd0 : 
                (s11[10]) ? {s11[10],1'b0,s11[9:8],1'b0,slot,s11[7:0]} : os11;
assign os12 = (clr) ? 15'd0 : 
                (s12[10]) ? {s12[10],1'b0,s12[9:8],1'b0,slot,s12[7:0]} : os12;
assign os13 = (clr) ? 15'd0 : 
                (s13[10]) ? {s13[10],1'b0,s13[9:8],1'b0,slot,s13[7:0]} : os13;

assign os20 = (clr) ? 15'd0 : 
                (s20[10]) ? {s20[10],1'b0,s20[9:8],1'b0,slot,s20[7:0]} : os20;
assign os21 = (clr) ? 15'd0 : 
                (s21[10]) ? {s21[10],1'b0,s21[9:8],1'b0,slot,s21[7:0]} : os21;
assign os22 = (clr) ? 15'd0 : 
                (s22[10]) ? {s22[10],1'b0,s22[9:8],1'b0,slot,s22[7:0]} : os22;
assign os23 = (clr) ? 15'd0 : 
                (s23[10]) ? {s23[10],1'b0,s23[9:8],1'b0,slot,s23[7:0]} : os23;

assign os30 = (clr) ? 15'd0 : 
                (s30[10]) ? {s30[10],1'b0,s30[9:8],1'b0,slot,s30[7:0]} : os30;
assign os31 = (clr) ? 15'd0 : 
                (s31[10]) ? {s31[10],1'b0,s31[9:8],1'b0,slot,s31[7:0]} : os31;
assign os32 = (clr) ? 15'd0 : 
                (s32[10]) ? {s32[10],1'b0,s32[9:8],1'b0,slot,s32[7:0]} : os32;
assign os33 = (clr) ? 15'd0 : 
                (s33[10]) ? {s33[10],1'b0,s33[9:8],1'b0,slot,s33[7:0]} : os33;
endmodule