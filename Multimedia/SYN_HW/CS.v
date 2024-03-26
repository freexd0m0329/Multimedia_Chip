//`timescale 1ns/10ps
module CS(Y,  X, reset, clk);
input         clk, reset; 
input  [7:0]  X;
output [9:0]  Y;
reg    [7:0]  X1,X2,X3,X4,X5,X6,X7,X8,X9,X1_d;
reg    [11:0] S1,S2,S3,S4,S5,S6,S7,S8,S9;
reg    [11:0] Xt;
wire   [11:0] Xt_temp=X9+Xt-X1_d;
wire   [11:0] C1_temp=Xt_temp-S1;
wire   [11:0] C2_temp=Xt_temp-S2;
wire   [11:0] C3_temp=Xt_temp-S3;
wire   [11:0] C4_temp=Xt_temp-S4;
wire   [11:0] C5_temp=Xt_temp-S5;
wire   [11:0] C6_temp=Xt_temp-S6;
wire   [11:0] C7_temp=Xt_temp-S7;
wire   [11:0] C8_temp=Xt_temp-S8;
wire   [11:0] C9_temp=Xt_temp-S9;
reg    [11:0] C1,C2,C3,C4,C5,C6,C7,C8,C9;
reg    [11:0] P1,P2,P3,P4,Q1,Q2,R1;
reg    [7:0]  PV1,PV2,PV3,PV4,QV1,QV2,RV1,Ycomp;
wire   [11:0] Y1=9*Ycomp;
wire   [12:0] Y2=Xt_temp+Y1;
wire   [9:0]  Y=Y2>>3;    //Y=(Xt+9xYcomp)>>3

 always @(posedge clk or posedge reset)begin  // store the 9 data of input X by shift register
    if(reset) begin  
       X1_d<=0;
       X1<=0; X2<=0; X3<=0;
       X4<=0; X5<=0; X6<=0;       
       X7<=0; X8<=0; X9<=0;            
    end 
    else begin
       X1_d<=X1;
       X1<=X2; X2<=X3; X3<=X4;
       X4<=X5; X5<=X6; X6<=X7;
       X7<=X8; X8<=X9; X9<=X;
    end
 end

 always @(posedge clk or posedge reset)begin  // store the 9 data of input (X * 9) by shift register
    if(reset) begin
       S1<=0; S2<=0; S3<=0;
       S4<=0; S5<=0; S6<=0;       
       S7<=0; S8<=0; S9<=0;             
    end 
    else begin
       S1<=S2; S2<=S3; S3<=S4;
       S4<=S5; S5<=S6; S6<=S7;
       S7<=S8; S8<=S9; S9<=X*4'd9;
    end
 end

 always @(posedge clk or posedge reset)begin  //Summary every 9 X result
    if(reset)   Xt=0;
    else        Xt=Xt_temp;
 end

//######  The Comparsion and get smallest value  ######
 always @(C1_temp or C2_temp or C3_temp or C4_temp or C5_temp or C6_temp or C7_temp or C8_temp or C9_temp)begin
    if(C1_temp[11])  C1=4095; else  C1=C1_temp;
    if(C2_temp[11])  C2=4095; else  C2=C2_temp;
    if(C3_temp[11])  C3=4095; else  C3=C3_temp;
    if(C4_temp[11])  C4=4095; else  C4=C4_temp;
    if(C5_temp[11])  C5=4095; else  C5=C5_temp;
    if(C6_temp[11])  C6=4095; else  C6=C6_temp;
    if(C7_temp[11])  C7=4095; else  C7=C7_temp;
    if(C8_temp[11])  C8=4095; else  C8=C8_temp;
    if(C9_temp[11])  C9=4095; else  C9=C9_temp;                
 end

 always @(C1 or C2 or C3 or C4 or C5 or C6 or C7 or C8 or X1 or X2 or X3 or X4 or X5 or X6 or X7 or X8)begin
    if(C1 < C2)begin P1=C1; PV1=X1; end   else begin P1=C2; PV1=X2;  end   
    if(C3 < C4)begin P2=C3; PV2=X3; end   else begin P2=C4; PV2=X4;  end    
    if(C5 < C6)begin P3=C5; PV3=X5; end   else begin P3=C6; PV3=X6;  end
    if(C7 < C8)begin P4=C7; PV4=X7; end   else begin P4=C8; PV4=X8;  end
 end

 always @(P1 or P2 or P3 or P4 or PV1 or PV2 or PV3 or PV4) begin
    if(P1 < P2)begin Q1=P1; QV1=PV1; end  else begin Q1=P2; QV1=PV2; end   
    if(P3 < P4)begin Q2=P3; QV2=PV3; end  else begin Q2=P4; QV2=PV4; end    
 end

 always @(Q1 or Q2 or QV1 or QV2)begin
    if(Q1 < Q2)begin R1=Q1; RV1=QV1; end  else begin R1=Q2; RV1=QV2; end    
 end
 
 always @(R1 or RV1 or C9 or X9)begin
    if(R1 < C9)begin Ycomp=RV1;      end  else begin Ycomp=X9;       end
 end
  
endmodule
