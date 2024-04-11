/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : Q-2019.12
// Date      : Thu Apr 11 15:55:10 2024
/////////////////////////////////////////////////////////////


module CS_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [12:0] carry;

  ADDFX2 U2_9 ( .A(A[9]), .B(n4), .CI(carry[9]), .CO(carry[10]), .S(DIFF[9])
         );
  ADDFX2 U2_8 ( .A(A[8]), .B(n5), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFX2 U2_7 ( .A(A[7]), .B(n6), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFX2 U2_6 ( .A(A[6]), .B(n7), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFX2 U2_1 ( .A(A[1]), .B(n12), .CI(n1), .CO(carry[2]), .S(DIFF[1]) );
  ADDFX2 U2_5 ( .A(A[5]), .B(n8), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFX2 U2_4 ( .A(A[4]), .B(n9), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFX2 U2_2 ( .A(A[2]), .B(n11), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2 U2_10 ( .A(A[10]), .B(n3), .CI(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  XOR3X2 U2_11 ( .A(A[11]), .B(n2), .C(carry[11]), .Y(DIFF[11]) );
  ADDFX2 U2_3 ( .A(A[3]), .B(n10), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  XNOR2XL U1 ( .A(n13), .B(A[0]), .Y(DIFF[0]) );
  OR2XL U2 ( .A(A[0]), .B(n13), .Y(n1) );
  INVX1 U3 ( .A(B[10]), .Y(n3) );
  INVX1 U4 ( .A(B[2]), .Y(n11) );
  INVX1 U5 ( .A(B[3]), .Y(n10) );
  INVX1 U6 ( .A(B[4]), .Y(n9) );
  INVX1 U7 ( .A(B[5]), .Y(n8) );
  INVX1 U8 ( .A(B[1]), .Y(n12) );
  INVX1 U9 ( .A(B[6]), .Y(n7) );
  INVX1 U10 ( .A(B[7]), .Y(n6) );
  INVX1 U11 ( .A(B[8]), .Y(n5) );
  INVX1 U12 ( .A(B[9]), .Y(n4) );
  INVX1 U13 ( .A(B[0]), .Y(n13) );
  INVX1 U14 ( .A(B[11]), .Y(n2) );
endmodule


module CS_DW01_add_5 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n5, n6, n7, n10, n12, n15, n16, n17, n18, n19, n22, n23,
         n24, n25, n26, n27, n29, n31, n32, n34, n36, n38, n43, n44, n45, n46,
         n47, n49, n51, n52, n54, n55, n57, n59, n60, n61, n62, n64, n116,
         n117, n118, n119, n120, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132;

  XOR2X4 U6 ( .A(n23), .B(n3), .Y(SUM[10]) );
  AOI21X4 U17 ( .A0(n1), .A1(n24), .B0(n25), .Y(n23) );
  BUFX20 U92 ( .A(B[8]), .Y(n116) );
  AOI21X2 U93 ( .A0(n132), .A1(n60), .B0(n57), .Y(n55) );
  NAND2X1 U94 ( .A(B[3]), .B(A[3]), .Y(n54) );
  XOR2X2 U95 ( .A(n16), .B(n2), .Y(SUM[11]) );
  OAI21X2 U96 ( .A0(n61), .A1(n64), .B0(n62), .Y(n60) );
  OAI2BB1X4 U97 ( .A0N(n118), .A1N(n126), .B0(n38), .Y(n1) );
  OAI21X2 U98 ( .A0(n45), .A1(n47), .B0(n46), .Y(n44) );
  OAI2BB1X2 U99 ( .A0N(n117), .A1N(n120), .B0(n54), .Y(n52) );
  XNOR2X2 U100 ( .A(n1), .B(n5), .Y(SUM[8]) );
  AOI21X2 U101 ( .A0(n52), .A1(n131), .B0(n49), .Y(n47) );
  XOR2X2 U102 ( .A(n32), .B(n122), .Y(SUM[9]) );
  XOR2X2 U103 ( .A(n12), .B(n64), .Y(SUM[1]) );
  NAND2BX1 U104 ( .AN(n19), .B(n22), .Y(n3) );
  NAND2BX1 U105 ( .AN(n61), .B(n62), .Y(n12) );
  XNOR2X1 U106 ( .A(n6), .B(n126), .Y(SUM[7]) );
  NOR2BX2 U107 ( .AN(n46), .B(n45), .Y(n123) );
  AOI21X2 U108 ( .A0(n1), .A1(n17), .B0(n18), .Y(n16) );
  INVX2 U109 ( .A(n59), .Y(n57) );
  NAND2X2 U110 ( .A(B[2]), .B(A[2]), .Y(n59) );
  OAI21X1 U111 ( .A0(n27), .A1(n19), .B0(n22), .Y(n18) );
  INVX1 U112 ( .A(n27), .Y(n25) );
  OR2X2 U113 ( .A(B[3]), .B(A[3]), .Y(n117) );
  OR2X2 U114 ( .A(B[7]), .B(A[7]), .Y(n118) );
  AOI21X2 U115 ( .A0(n128), .A1(n34), .B0(n29), .Y(n27) );
  XNOR2X1 U116 ( .A(n7), .B(n44), .Y(SUM[6]) );
  NAND2X2 U117 ( .A(B[4]), .B(A[4]), .Y(n51) );
  NOR2X1 U118 ( .A(n116), .B(A[10]), .Y(n19) );
  OR2X2 U119 ( .A(n116), .B(A[9]), .Y(n128) );
  NAND2X1 U120 ( .A(n116), .B(A[10]), .Y(n22) );
  AND2X2 U121 ( .A(n132), .B(n59), .Y(n125) );
  AND2X2 U122 ( .A(n131), .B(n51), .Y(n124) );
  OR2X2 U123 ( .A(B[0]), .B(A[0]), .Y(n119) );
  NOR2X1 U124 ( .A(n26), .B(n19), .Y(n17) );
  OR2X4 U125 ( .A(B[2]), .B(A[2]), .Y(n132) );
  OR2X4 U126 ( .A(B[4]), .B(A[4]), .Y(n131) );
  NAND2X2 U127 ( .A(B[5]), .B(A[5]), .Y(n46) );
  OAI2BB1X4 U128 ( .A0N(n44), .A1N(n130), .B0(n43), .Y(n126) );
  NAND2XL U129 ( .A(n128), .B(n31), .Y(n122) );
  NAND2X2 U130 ( .A(B[0]), .B(A[0]), .Y(n64) );
  NAND2X4 U131 ( .A(B[6]), .B(A[6]), .Y(n43) );
  OR2X2 U132 ( .A(B[6]), .B(A[6]), .Y(n130) );
  INVX1 U133 ( .A(n55), .Y(n120) );
  XOR2XL U134 ( .A(n125), .B(n60), .Y(SUM[2]) );
  NOR2X4 U135 ( .A(B[1]), .B(A[1]), .Y(n61) );
  NAND2X1 U136 ( .A(n116), .B(A[9]), .Y(n31) );
  XNOR2X1 U137 ( .A(n123), .B(n47), .Y(SUM[5]) );
  NAND2X2 U138 ( .A(B[1]), .B(A[1]), .Y(n62) );
  INVX1 U139 ( .A(n26), .Y(n24) );
  AND2X1 U140 ( .A(n119), .B(n64), .Y(SUM[0]) );
  NAND2X2 U141 ( .A(n116), .B(A[8]), .Y(n36) );
  NAND2X1 U142 ( .A(n116), .B(A[11]), .Y(n15) );
  OR2X2 U143 ( .A(n116), .B(A[11]), .Y(n129) );
  OR2X4 U144 ( .A(n116), .B(A[8]), .Y(n127) );
  XOR2XL U145 ( .A(n124), .B(n52), .Y(SUM[4]) );
  NAND2X4 U146 ( .A(B[7]), .B(A[7]), .Y(n38) );
  AOI21X2 U147 ( .A0(n1), .A1(n127), .B0(n34), .Y(n32) );
  INVX1 U148 ( .A(n51), .Y(n49) );
  INVX1 U149 ( .A(n31), .Y(n29) );
  XOR2X1 U150 ( .A(n10), .B(n55), .Y(SUM[3]) );
  NAND2X1 U151 ( .A(n117), .B(n54), .Y(n10) );
  NAND2X1 U152 ( .A(n127), .B(n128), .Y(n26) );
  NAND2X1 U153 ( .A(n130), .B(n43), .Y(n7) );
  NAND2X1 U154 ( .A(n127), .B(n36), .Y(n5) );
  NAND2X1 U155 ( .A(n118), .B(n38), .Y(n6) );
  NAND2X1 U156 ( .A(n129), .B(n15), .Y(n2) );
  INVX1 U157 ( .A(n36), .Y(n34) );
  NOR2X2 U158 ( .A(B[5]), .B(A[5]), .Y(n45) );
endmodule


module CS_DW01_sub_18 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17,
         n18, n19, n21, n22, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34,
         n35, n37, n39, n40, n41, n42, n43, n45, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n58, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n121, n122, n123, n124, n125;

  AOI21X2 U94 ( .A0(n124), .A1(n32), .B0(n29), .Y(n27) );
  NAND2BX1 U95 ( .AN(n49), .B(n50), .Y(n10) );
  NAND2BX1 U96 ( .AN(n17), .B(n18), .Y(n2) );
  NAND2BX1 U97 ( .AN(n25), .B(n26), .Y(n4) );
  NAND2BX1 U98 ( .AN(n33), .B(n34), .Y(n6) );
  NAND2BX1 U99 ( .AN(n53), .B(n54), .Y(n11) );
  AOI21X1 U100 ( .A0(n123), .A1(n40), .B0(n37), .Y(n35) );
  OAI21X1 U101 ( .A0(n51), .A1(n49), .B0(n50), .Y(n48) );
  NAND2BX1 U102 ( .AN(n41), .B(n42), .Y(n8) );
  OAI21X2 U103 ( .A0(n43), .A1(n41), .B0(n42), .Y(n40) );
  AOI21X4 U104 ( .A0(n48), .A1(n122), .B0(n45), .Y(n43) );
  NOR2X1 U105 ( .A(A[0]), .B(n78), .Y(n55) );
  NOR2X1 U106 ( .A(A[4]), .B(n74), .Y(n41) );
  INVX1 U107 ( .A(B[2]), .Y(n76) );
  INVX1 U108 ( .A(B[1]), .Y(n77) );
  INVX1 U109 ( .A(B[6]), .Y(n72) );
  INVX1 U110 ( .A(B[0]), .Y(n78) );
  INVX1 U111 ( .A(B[3]), .Y(n75) );
  INVX1 U112 ( .A(B[4]), .Y(n74) );
  INVX1 U113 ( .A(B[5]), .Y(n73) );
  NOR2X1 U114 ( .A(A[2]), .B(n76), .Y(n49) );
  XOR2XL U115 ( .A(n4), .B(n27), .Y(DIFF[8]) );
  OAI21X2 U116 ( .A0(n27), .A1(n25), .B0(n26), .Y(n24) );
  XOR2X1 U117 ( .A(n121), .B(n24), .Y(DIFF[9]) );
  AND2X2 U118 ( .A(n58), .B(n23), .Y(n121) );
  INVX1 U119 ( .A(B[7]), .Y(n71) );
  INVX1 U120 ( .A(B[9]), .Y(n69) );
  INVX1 U121 ( .A(B[8]), .Y(n70) );
  INVX1 U122 ( .A(B[10]), .Y(n68) );
  OAI21X2 U123 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  XOR2X2 U124 ( .A(n19), .B(n2), .Y(DIFF[10]) );
  XNOR2XL U125 ( .A(n5), .B(n32), .Y(DIFF[7]) );
  AOI21XL U126 ( .A0(n15), .A1(n24), .B0(n16), .Y(n14) );
  XNOR2XL U127 ( .A(n7), .B(n40), .Y(DIFF[5]) );
  XOR2XL U128 ( .A(n6), .B(n35), .Y(DIFF[6]) );
  XNOR2XL U129 ( .A(n9), .B(n48), .Y(DIFF[3]) );
  XOR2XL U130 ( .A(n8), .B(n43), .Y(DIFF[4]) );
  XOR2XL U131 ( .A(n10), .B(n51), .Y(DIFF[2]) );
  NOR2XL U132 ( .A(A[10]), .B(n68), .Y(n17) );
  NOR2XL U133 ( .A(A[9]), .B(n69), .Y(n22) );
  NOR2XL U134 ( .A(A[1]), .B(n77), .Y(n53) );
  NOR2XL U135 ( .A(A[8]), .B(n70), .Y(n25) );
  NAND2XL U136 ( .A(A[9]), .B(n69), .Y(n23) );
  NAND2XL U137 ( .A(A[1]), .B(n77), .Y(n54) );
  NAND2XL U138 ( .A(A[3]), .B(n75), .Y(n47) );
  NAND2XL U139 ( .A(A[8]), .B(n70), .Y(n26) );
  NOR2XL U140 ( .A(A[6]), .B(n72), .Y(n33) );
  NAND2XL U141 ( .A(A[5]), .B(n73), .Y(n39) );
  NAND2XL U142 ( .A(A[7]), .B(n71), .Y(n31) );
  NAND2XL U143 ( .A(A[6]), .B(n72), .Y(n34) );
  NAND2XL U144 ( .A(A[10]), .B(n68), .Y(n18) );
  NAND2XL U145 ( .A(A[4]), .B(n74), .Y(n42) );
  NAND2XL U146 ( .A(A[2]), .B(n76), .Y(n50) );
  NAND2XL U147 ( .A(A[11]), .B(n67), .Y(n13) );
  OR2XL U148 ( .A(A[5]), .B(n73), .Y(n123) );
  OR2XL U149 ( .A(A[3]), .B(n75), .Y(n122) );
  OR2XL U150 ( .A(A[7]), .B(n71), .Y(n124) );
  OR2XL U151 ( .A(A[11]), .B(n67), .Y(n125) );
  INVX1 U152 ( .A(n39), .Y(n37) );
  INVX1 U153 ( .A(n31), .Y(n29) );
  INVX1 U154 ( .A(n47), .Y(n45) );
  AOI21X1 U155 ( .A0(n24), .A1(n58), .B0(n21), .Y(n19) );
  INVX1 U156 ( .A(n52), .Y(n51) );
  OAI21XL U157 ( .A0(n53), .A1(n55), .B0(n54), .Y(n52) );
  INVX1 U158 ( .A(n22), .Y(n58) );
  INVX1 U159 ( .A(n23), .Y(n21) );
  NAND2X1 U160 ( .A(n122), .B(n47), .Y(n9) );
  OAI21XL U161 ( .A0(n17), .A1(n23), .B0(n18), .Y(n16) );
  NAND2X1 U162 ( .A(n123), .B(n39), .Y(n7) );
  NOR2X1 U163 ( .A(n22), .B(n17), .Y(n15) );
  NAND2X1 U164 ( .A(n124), .B(n31), .Y(n5) );
  XOR2X1 U165 ( .A(n14), .B(n1), .Y(DIFF[11]) );
  NAND2X1 U166 ( .A(n125), .B(n13), .Y(n1) );
  XOR2X1 U167 ( .A(n11), .B(n55), .Y(DIFF[1]) );
  XNOR2X1 U168 ( .A(A[0]), .B(n78), .Y(DIFF[0]) );
  INVX1 U169 ( .A(B[11]), .Y(n67) );
endmodule


module CS_DW01_sub_22 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17,
         n18, n19, n21, n22, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34,
         n35, n37, n39, n40, n41, n42, n43, n45, n47, n48, n49, n50, n51, n53,
         n54, n55, n58, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n121, n122, n123, n124, n125, n126, n127;

  AOI21X4 U7 ( .A0(n15), .A1(n24), .B0(n16), .Y(n14) );
  BUFX4 U94 ( .A(n23), .Y(n121) );
  NAND2X1 U95 ( .A(n58), .B(n121), .Y(n3) );
  INVX2 U96 ( .A(n121), .Y(n21) );
  OAI21X2 U97 ( .A0(n123), .A1(n121), .B0(n18), .Y(n16) );
  NOR2X1 U98 ( .A(n22), .B(n123), .Y(n15) );
  OAI21XL U99 ( .A0(n53), .A1(n55), .B0(n54), .Y(n122) );
  INVX1 U100 ( .A(n122), .Y(n51) );
  NAND2BX1 U101 ( .AN(n53), .B(n54), .Y(n11) );
  AOI21X4 U102 ( .A0(n126), .A1(n32), .B0(n29), .Y(n27) );
  INVX1 U103 ( .A(n31), .Y(n29) );
  AOI21X2 U104 ( .A0(n125), .A1(n40), .B0(n37), .Y(n35) );
  NAND2BX1 U105 ( .AN(n49), .B(n50), .Y(n10) );
  NAND2BX1 U106 ( .AN(n41), .B(n42), .Y(n8) );
  NAND2BX1 U107 ( .AN(n25), .B(n26), .Y(n4) );
  NAND2BX1 U108 ( .AN(n17), .B(n18), .Y(n2) );
  BUFX3 U109 ( .A(n17), .Y(n123) );
  NAND2X2 U110 ( .A(n127), .B(n13), .Y(n1) );
  NAND2XL U111 ( .A(A[9]), .B(n69), .Y(n23) );
  NOR2X1 U112 ( .A(A[9]), .B(n69), .Y(n22) );
  NOR2X1 U113 ( .A(A[10]), .B(n68), .Y(n17) );
  INVX1 U114 ( .A(n22), .Y(n58) );
  NOR2X1 U115 ( .A(A[6]), .B(n72), .Y(n33) );
  NAND2XL U116 ( .A(n126), .B(n31), .Y(n5) );
  NOR2XL U117 ( .A(A[0]), .B(n78), .Y(n55) );
  NOR2X1 U118 ( .A(A[8]), .B(n70), .Y(n25) );
  OAI21X4 U119 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  INVX1 U120 ( .A(B[1]), .Y(n77) );
  INVX1 U121 ( .A(B[0]), .Y(n78) );
  INVX1 U122 ( .A(B[5]), .Y(n73) );
  INVX1 U123 ( .A(B[3]), .Y(n75) );
  INVX1 U124 ( .A(B[2]), .Y(n76) );
  INVX1 U125 ( .A(B[4]), .Y(n74) );
  INVX1 U126 ( .A(B[6]), .Y(n72) );
  OR2X1 U127 ( .A(A[7]), .B(n71), .Y(n126) );
  OAI21X1 U128 ( .A0(n49), .A1(n51), .B0(n50), .Y(n48) );
  NOR2X1 U129 ( .A(A[4]), .B(n74), .Y(n41) );
  OAI21X2 U130 ( .A0(n43), .A1(n41), .B0(n42), .Y(n40) );
  OAI21X4 U131 ( .A0(n27), .A1(n25), .B0(n26), .Y(n24) );
  XOR2X4 U132 ( .A(n14), .B(n1), .Y(DIFF[11]) );
  NAND2BXL U133 ( .AN(n33), .B(n34), .Y(n6) );
  INVX1 U134 ( .A(B[10]), .Y(n68) );
  INVX1 U135 ( .A(B[9]), .Y(n69) );
  INVX1 U136 ( .A(B[8]), .Y(n70) );
  INVX1 U137 ( .A(B[7]), .Y(n71) );
  INVX1 U138 ( .A(B[11]), .Y(n67) );
  AOI21X2 U139 ( .A0(n48), .A1(n124), .B0(n45), .Y(n43) );
  XOR2XL U140 ( .A(n4), .B(n27), .Y(DIFF[8]) );
  XNOR2XL U141 ( .A(n5), .B(n32), .Y(DIFF[7]) );
  XNOR2XL U142 ( .A(n7), .B(n40), .Y(DIFF[5]) );
  XOR2XL U143 ( .A(n8), .B(n43), .Y(DIFF[4]) );
  XNOR2XL U144 ( .A(n9), .B(n48), .Y(DIFF[3]) );
  XOR2XL U145 ( .A(n10), .B(n51), .Y(DIFF[2]) );
  NAND2XL U146 ( .A(A[11]), .B(n67), .Y(n13) );
  OR2XL U147 ( .A(A[11]), .B(n67), .Y(n127) );
  NOR2XL U148 ( .A(A[1]), .B(n77), .Y(n53) );
  NAND2XL U149 ( .A(A[8]), .B(n70), .Y(n26) );
  NAND2XL U150 ( .A(A[1]), .B(n77), .Y(n54) );
  NAND2XL U151 ( .A(A[3]), .B(n75), .Y(n47) );
  NAND2XL U152 ( .A(A[10]), .B(n68), .Y(n18) );
  OR2XL U153 ( .A(A[3]), .B(n75), .Y(n124) );
  NOR2XL U154 ( .A(A[2]), .B(n76), .Y(n49) );
  NAND2XL U155 ( .A(A[5]), .B(n73), .Y(n39) );
  NAND2XL U156 ( .A(A[7]), .B(n71), .Y(n31) );
  NAND2XL U157 ( .A(A[6]), .B(n72), .Y(n34) );
  NAND2XL U158 ( .A(A[4]), .B(n74), .Y(n42) );
  NAND2XL U159 ( .A(A[2]), .B(n76), .Y(n50) );
  OR2XL U160 ( .A(A[5]), .B(n73), .Y(n125) );
  INVX1 U161 ( .A(n47), .Y(n45) );
  INVX1 U162 ( .A(n39), .Y(n37) );
  XOR2X1 U163 ( .A(n19), .B(n2), .Y(DIFF[10]) );
  NAND2X1 U164 ( .A(n125), .B(n39), .Y(n7) );
  NAND2X1 U165 ( .A(n124), .B(n47), .Y(n9) );
  XOR2X1 U166 ( .A(n11), .B(n55), .Y(DIFF[1]) );
  XNOR2X1 U167 ( .A(A[0]), .B(n78), .Y(DIFF[0]) );
  XOR2XL U168 ( .A(n6), .B(n35), .Y(DIFF[6]) );
  XNOR2XL U169 ( .A(n3), .B(n24), .Y(DIFF[9]) );
  AOI21X1 U170 ( .A0(n24), .A1(n58), .B0(n21), .Y(n19) );
endmodule


module CS_DW01_sub_19 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17,
         n18, n19, n21, n22, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34,
         n35, n37, n39, n40, n41, n42, n43, n45, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n58, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n121, n122, n123, n124, n125, n126, n127;

  OAI21X2 U94 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  AOI21X4 U95 ( .A0(n125), .A1(n40), .B0(n37), .Y(n35) );
  NOR2X1 U96 ( .A(A[6]), .B(n72), .Y(n33) );
  XOR2X1 U97 ( .A(n19), .B(n2), .Y(DIFF[10]) );
  NAND2BX1 U98 ( .AN(n25), .B(n26), .Y(n4) );
  NAND2BX1 U99 ( .AN(n49), .B(n50), .Y(n10) );
  NAND2BX1 U100 ( .AN(n33), .B(n34), .Y(n6) );
  NAND2BX1 U101 ( .AN(n17), .B(n18), .Y(n2) );
  NAND2BX1 U102 ( .AN(n53), .B(n54), .Y(n11) );
  NAND2BX1 U103 ( .AN(n41), .B(n42), .Y(n8) );
  OAI21X2 U104 ( .A0(n43), .A1(n41), .B0(n42), .Y(n40) );
  INVX1 U105 ( .A(n22), .Y(n58) );
  XOR2X1 U106 ( .A(n8), .B(n43), .Y(DIFF[4]) );
  NOR2X1 U107 ( .A(A[2]), .B(n76), .Y(n49) );
  NOR2X1 U108 ( .A(A[4]), .B(n74), .Y(n41) );
  NOR2X1 U109 ( .A(A[0]), .B(n78), .Y(n55) );
  INVX1 U110 ( .A(B[1]), .Y(n77) );
  INVX1 U111 ( .A(B[0]), .Y(n78) );
  INVX1 U112 ( .A(B[5]), .Y(n73) );
  XOR2XL U113 ( .A(n11), .B(n55), .Y(DIFF[1]) );
  INVX1 U114 ( .A(B[2]), .Y(n76) );
  OAI21XL U115 ( .A0(n53), .A1(n55), .B0(n54), .Y(n52) );
  INVX1 U116 ( .A(B[3]), .Y(n75) );
  INVX1 U117 ( .A(B[4]), .Y(n74) );
  INVX1 U118 ( .A(B[6]), .Y(n72) );
  NAND2X1 U119 ( .A(n122), .B(n26), .Y(n24) );
  XOR2X1 U120 ( .A(n123), .B(n121), .Y(DIFF[9]) );
  AOI21X1 U121 ( .A0(n15), .A1(n121), .B0(n16), .Y(n14) );
  NOR2XL U122 ( .A(n22), .B(n17), .Y(n15) );
  AOI21X2 U123 ( .A0(n48), .A1(n124), .B0(n45), .Y(n43) );
  NAND2X1 U124 ( .A(n122), .B(n26), .Y(n121) );
  OR2X4 U125 ( .A(n27), .B(n25), .Y(n122) );
  AOI21X1 U126 ( .A0(n24), .A1(n58), .B0(n21), .Y(n19) );
  AOI21X2 U127 ( .A0(n126), .A1(n32), .B0(n29), .Y(n27) );
  INVX1 U128 ( .A(B[7]), .Y(n71) );
  OAI21X2 U129 ( .A0(n49), .A1(n51), .B0(n50), .Y(n48) );
  INVX1 U130 ( .A(B[9]), .Y(n69) );
  INVX1 U131 ( .A(B[8]), .Y(n70) );
  INVX1 U132 ( .A(B[10]), .Y(n68) );
  AND2X2 U133 ( .A(n58), .B(n23), .Y(n123) );
  XOR2XL U134 ( .A(n4), .B(n27), .Y(DIFF[8]) );
  XNOR2XL U135 ( .A(n5), .B(n32), .Y(DIFF[7]) );
  XNOR2XL U136 ( .A(n7), .B(n40), .Y(DIFF[5]) );
  XOR2XL U137 ( .A(n6), .B(n35), .Y(DIFF[6]) );
  XNOR2XL U138 ( .A(n9), .B(n48), .Y(DIFF[3]) );
  XOR2XL U139 ( .A(n10), .B(n51), .Y(DIFF[2]) );
  NOR2XL U140 ( .A(A[10]), .B(n68), .Y(n17) );
  NOR2XL U141 ( .A(A[9]), .B(n69), .Y(n22) );
  NOR2XL U142 ( .A(A[1]), .B(n77), .Y(n53) );
  NOR2XL U143 ( .A(A[8]), .B(n70), .Y(n25) );
  NAND2XL U144 ( .A(A[9]), .B(n69), .Y(n23) );
  NAND2XL U145 ( .A(A[5]), .B(n73), .Y(n39) );
  NAND2XL U146 ( .A(A[1]), .B(n77), .Y(n54) );
  NAND2XL U147 ( .A(A[3]), .B(n75), .Y(n47) );
  NAND2XL U148 ( .A(A[8]), .B(n70), .Y(n26) );
  NAND2XL U149 ( .A(A[10]), .B(n68), .Y(n18) );
  OR2XL U150 ( .A(A[3]), .B(n75), .Y(n124) );
  NAND2XL U151 ( .A(A[7]), .B(n71), .Y(n31) );
  NAND2XL U152 ( .A(A[6]), .B(n72), .Y(n34) );
  NAND2XL U153 ( .A(A[4]), .B(n74), .Y(n42) );
  NAND2XL U154 ( .A(A[2]), .B(n76), .Y(n50) );
  NAND2XL U155 ( .A(A[11]), .B(n67), .Y(n13) );
  OR2XL U156 ( .A(A[5]), .B(n73), .Y(n125) );
  OR2XL U157 ( .A(A[7]), .B(n71), .Y(n126) );
  OR2XL U158 ( .A(A[11]), .B(n67), .Y(n127) );
  INVX1 U159 ( .A(n39), .Y(n37) );
  INVX1 U160 ( .A(n31), .Y(n29) );
  INVX1 U161 ( .A(n47), .Y(n45) );
  INVX1 U162 ( .A(n52), .Y(n51) );
  INVX1 U163 ( .A(n23), .Y(n21) );
  NAND2X1 U164 ( .A(n124), .B(n47), .Y(n9) );
  OAI21XL U165 ( .A0(n17), .A1(n23), .B0(n18), .Y(n16) );
  NAND2X1 U166 ( .A(n125), .B(n39), .Y(n7) );
  NAND2X1 U167 ( .A(n126), .B(n31), .Y(n5) );
  XOR2X1 U168 ( .A(n14), .B(n1), .Y(DIFF[11]) );
  NAND2X1 U169 ( .A(n127), .B(n13), .Y(n1) );
  XNOR2X1 U170 ( .A(A[0]), .B(n78), .Y(DIFF[0]) );
  INVX1 U171 ( .A(B[11]), .Y(n67) );
endmodule


module CS_DW01_sub_23 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17,
         n18, n19, n21, n22, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34,
         n35, n39, n40, n41, n42, n43, n45, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n57, n58, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n121, n122, n123, n124, n125, n126;

  XOR2X4 U1 ( .A(n14), .B(n1), .Y(DIFF[11]) );
  AOI21X4 U7 ( .A0(n15), .A1(n24), .B0(n16), .Y(n14) );
  XNOR2XL U94 ( .A(n9), .B(n48), .Y(DIFF[3]) );
  OAI21X2 U95 ( .A0(n17), .A1(n23), .B0(n18), .Y(n16) );
  NAND2X1 U96 ( .A(A[9]), .B(n69), .Y(n23) );
  NOR2X4 U97 ( .A(A[10]), .B(n68), .Y(n17) );
  XOR2X1 U98 ( .A(n19), .B(n2), .Y(DIFF[10]) );
  OAI21X1 U99 ( .A0(n51), .A1(n49), .B0(n50), .Y(n48) );
  NAND2BX1 U100 ( .AN(n53), .B(n54), .Y(n11) );
  NAND2BX1 U101 ( .AN(n41), .B(n42), .Y(n8) );
  AOI21XL U102 ( .A0(n58), .A1(n24), .B0(n21), .Y(n19) );
  NAND2BXL U103 ( .AN(n49), .B(n50), .Y(n10) );
  NOR2BX1 U104 ( .AN(n34), .B(n33), .Y(n122) );
  INVX1 U105 ( .A(n52), .Y(n51) );
  OAI21X1 U106 ( .A0(n53), .A1(n55), .B0(n54), .Y(n52) );
  NAND2X1 U107 ( .A(A[2]), .B(n76), .Y(n50) );
  OAI21X2 U108 ( .A0(n43), .A1(n41), .B0(n42), .Y(n40) );
  NOR2X1 U109 ( .A(A[9]), .B(n69), .Y(n22) );
  INVX1 U110 ( .A(n17), .Y(n57) );
  NOR2X1 U111 ( .A(A[0]), .B(n78), .Y(n55) );
  NAND2XL U112 ( .A(A[3]), .B(n75), .Y(n47) );
  OR2XL U113 ( .A(A[3]), .B(n75), .Y(n123) );
  INVX1 U114 ( .A(B[3]), .Y(n75) );
  INVX1 U115 ( .A(B[1]), .Y(n77) );
  INVX1 U116 ( .A(B[0]), .Y(n78) );
  INVX1 U117 ( .A(B[5]), .Y(n73) );
  INVX1 U118 ( .A(B[9]), .Y(n69) );
  INVX1 U119 ( .A(B[2]), .Y(n76) );
  INVX1 U120 ( .A(B[4]), .Y(n74) );
  INVX1 U121 ( .A(B[6]), .Y(n72) );
  INVX1 U122 ( .A(B[7]), .Y(n71) );
  INVX1 U123 ( .A(B[10]), .Y(n68) );
  NAND2X2 U124 ( .A(n124), .B(n40), .Y(n121) );
  NOR2X1 U125 ( .A(n22), .B(n17), .Y(n15) );
  NAND2X1 U126 ( .A(n58), .B(n23), .Y(n3) );
  NAND2X1 U127 ( .A(A[5]), .B(n73), .Y(n39) );
  AND2X4 U128 ( .A(n121), .B(n39), .Y(n35) );
  INVX1 U129 ( .A(n22), .Y(n58) );
  INVX1 U130 ( .A(n23), .Y(n21) );
  AOI21X4 U131 ( .A0(n125), .A1(n32), .B0(n29), .Y(n27) );
  OR2X1 U132 ( .A(A[7]), .B(n71), .Y(n125) );
  OR2X2 U133 ( .A(A[5]), .B(n73), .Y(n124) );
  NOR2X1 U134 ( .A(A[4]), .B(n74), .Y(n41) );
  NOR2X2 U135 ( .A(A[2]), .B(n76), .Y(n49) );
  NAND2X1 U136 ( .A(A[7]), .B(n71), .Y(n31) );
  OAI21X4 U137 ( .A0(n27), .A1(n25), .B0(n26), .Y(n24) );
  NAND2X2 U138 ( .A(n126), .B(n13), .Y(n1) );
  NOR2X1 U139 ( .A(A[1]), .B(n77), .Y(n53) );
  NAND2X1 U140 ( .A(A[11]), .B(n67), .Y(n13) );
  INVX1 U141 ( .A(B[8]), .Y(n70) );
  INVX1 U142 ( .A(B[11]), .Y(n67) );
  OAI21X4 U143 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  AOI21X2 U144 ( .A0(n48), .A1(n123), .B0(n45), .Y(n43) );
  NAND2XL U145 ( .A(n57), .B(n18), .Y(n2) );
  NAND2BXL U146 ( .AN(n25), .B(n26), .Y(n4) );
  XNOR2XL U147 ( .A(n5), .B(n32), .Y(DIFF[7]) );
  XNOR2XL U148 ( .A(n7), .B(n40), .Y(DIFF[5]) );
  XOR2XL U149 ( .A(n8), .B(n43), .Y(DIFF[4]) );
  XNOR2XL U150 ( .A(n122), .B(n35), .Y(DIFF[6]) );
  XOR2XL U151 ( .A(n10), .B(n51), .Y(DIFF[2]) );
  NAND2XL U152 ( .A(A[1]), .B(n77), .Y(n54) );
  OR2XL U153 ( .A(A[11]), .B(n67), .Y(n126) );
  NAND2XL U154 ( .A(A[6]), .B(n72), .Y(n34) );
  NAND2XL U155 ( .A(A[4]), .B(n74), .Y(n42) );
  INVX1 U156 ( .A(n47), .Y(n45) );
  INVX1 U157 ( .A(n31), .Y(n29) );
  NAND2X1 U158 ( .A(n125), .B(n31), .Y(n5) );
  NAND2X1 U159 ( .A(n124), .B(n39), .Y(n7) );
  NAND2X1 U160 ( .A(n123), .B(n47), .Y(n9) );
  XOR2X1 U161 ( .A(n11), .B(n55), .Y(DIFF[1]) );
  NOR2X1 U162 ( .A(A[6]), .B(n72), .Y(n33) );
  NOR2X1 U163 ( .A(A[8]), .B(n70), .Y(n25) );
  NAND2X1 U164 ( .A(A[8]), .B(n70), .Y(n26) );
  NAND2X1 U165 ( .A(A[10]), .B(n68), .Y(n18) );
  XNOR2X1 U166 ( .A(A[0]), .B(n78), .Y(DIFF[0]) );
  XOR2X1 U167 ( .A(n4), .B(n27), .Y(DIFF[8]) );
  XNOR2XL U168 ( .A(n3), .B(n24), .Y(DIFF[9]) );
endmodule


module CS_DW01_sub_20 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17,
         n18, n19, n21, n22, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34,
         n35, n37, n39, n40, n41, n42, n43, n45, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n57, n58, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n121, n122, n123, n124, n125;

  XOR2X2 U94 ( .A(n121), .B(n24), .Y(DIFF[9]) );
  NOR2X1 U95 ( .A(A[0]), .B(n78), .Y(n55) );
  NAND2BX1 U96 ( .AN(n53), .B(n54), .Y(n11) );
  NAND2BX1 U97 ( .AN(n49), .B(n50), .Y(n10) );
  NAND2BX1 U98 ( .AN(n41), .B(n42), .Y(n8) );
  NAND2BX1 U99 ( .AN(n33), .B(n34), .Y(n6) );
  NAND2BX1 U100 ( .AN(n25), .B(n26), .Y(n4) );
  OAI21X1 U101 ( .A0(n51), .A1(n49), .B0(n50), .Y(n48) );
  AOI21X2 U102 ( .A0(n123), .A1(n40), .B0(n37), .Y(n35) );
  AOI21X4 U103 ( .A0(n124), .A1(n32), .B0(n29), .Y(n27) );
  OAI21X4 U104 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  NOR2X1 U105 ( .A(A[2]), .B(n76), .Y(n49) );
  NOR2X1 U106 ( .A(A[4]), .B(n74), .Y(n41) );
  OAI21X1 U107 ( .A0(n43), .A1(n41), .B0(n42), .Y(n40) );
  XOR2X2 U108 ( .A(n19), .B(n2), .Y(DIFF[10]) );
  INVX1 U109 ( .A(B[1]), .Y(n77) );
  INVX1 U110 ( .A(B[0]), .Y(n78) );
  INVX1 U111 ( .A(B[2]), .Y(n76) );
  INVX1 U112 ( .A(B[3]), .Y(n75) );
  OAI21XL U113 ( .A0(n53), .A1(n55), .B0(n54), .Y(n52) );
  INVX1 U114 ( .A(B[4]), .Y(n74) );
  INVX1 U115 ( .A(B[5]), .Y(n73) );
  INVX1 U116 ( .A(B[6]), .Y(n72) );
  INVX1 U117 ( .A(n17), .Y(n57) );
  AOI21X2 U118 ( .A0(n48), .A1(n122), .B0(n45), .Y(n43) );
  NOR2X1 U119 ( .A(A[1]), .B(n77), .Y(n53) );
  XOR2XL U120 ( .A(n4), .B(n27), .Y(DIFF[8]) );
  OAI21X2 U121 ( .A0(n27), .A1(n25), .B0(n26), .Y(n24) );
  AND2X2 U122 ( .A(n58), .B(n23), .Y(n121) );
  INVX1 U123 ( .A(B[7]), .Y(n71) );
  INVX1 U124 ( .A(B[9]), .Y(n69) );
  INVX1 U125 ( .A(B[8]), .Y(n70) );
  INVX1 U126 ( .A(B[10]), .Y(n68) );
  XNOR2XL U127 ( .A(n5), .B(n32), .Y(DIFF[7]) );
  AOI21XL U128 ( .A0(n15), .A1(n24), .B0(n16), .Y(n14) );
  XNOR2XL U129 ( .A(n7), .B(n40), .Y(DIFF[5]) );
  XOR2XL U130 ( .A(n6), .B(n35), .Y(DIFF[6]) );
  XNOR2XL U131 ( .A(n9), .B(n48), .Y(DIFF[3]) );
  XOR2XL U132 ( .A(n8), .B(n43), .Y(DIFF[4]) );
  XOR2XL U133 ( .A(n10), .B(n51), .Y(DIFF[2]) );
  NOR2XL U134 ( .A(A[10]), .B(n68), .Y(n17) );
  NOR2XL U135 ( .A(A[9]), .B(n69), .Y(n22) );
  NOR2XL U136 ( .A(A[8]), .B(n70), .Y(n25) );
  NAND2XL U137 ( .A(A[9]), .B(n69), .Y(n23) );
  NAND2XL U138 ( .A(A[1]), .B(n77), .Y(n54) );
  NAND2XL U139 ( .A(A[3]), .B(n75), .Y(n47) );
  NAND2XL U140 ( .A(A[8]), .B(n70), .Y(n26) );
  OR2XL U141 ( .A(A[3]), .B(n75), .Y(n122) );
  NOR2XL U142 ( .A(A[6]), .B(n72), .Y(n33) );
  NAND2XL U143 ( .A(A[5]), .B(n73), .Y(n39) );
  NAND2XL U144 ( .A(A[7]), .B(n71), .Y(n31) );
  NAND2XL U145 ( .A(A[6]), .B(n72), .Y(n34) );
  NAND2XL U146 ( .A(A[10]), .B(n68), .Y(n18) );
  NAND2XL U147 ( .A(A[4]), .B(n74), .Y(n42) );
  NAND2XL U148 ( .A(A[2]), .B(n76), .Y(n50) );
  NAND2XL U149 ( .A(A[11]), .B(n67), .Y(n13) );
  OR2XL U150 ( .A(A[5]), .B(n73), .Y(n123) );
  OR2XL U151 ( .A(A[7]), .B(n71), .Y(n124) );
  OR2XL U152 ( .A(A[11]), .B(n67), .Y(n125) );
  INVX1 U153 ( .A(n39), .Y(n37) );
  INVX1 U154 ( .A(n31), .Y(n29) );
  INVX1 U155 ( .A(n47), .Y(n45) );
  NAND2X1 U156 ( .A(n57), .B(n18), .Y(n2) );
  AOI21X1 U157 ( .A0(n24), .A1(n58), .B0(n21), .Y(n19) );
  INVX1 U158 ( .A(n52), .Y(n51) );
  INVX1 U159 ( .A(n22), .Y(n58) );
  INVX1 U160 ( .A(n23), .Y(n21) );
  NAND2X1 U161 ( .A(n122), .B(n47), .Y(n9) );
  OAI21XL U162 ( .A0(n17), .A1(n23), .B0(n18), .Y(n16) );
  NOR2X1 U163 ( .A(n22), .B(n17), .Y(n15) );
  NAND2X1 U164 ( .A(n124), .B(n31), .Y(n5) );
  NAND2X1 U165 ( .A(n123), .B(n39), .Y(n7) );
  XOR2X1 U166 ( .A(n14), .B(n1), .Y(DIFF[11]) );
  NAND2X1 U167 ( .A(n125), .B(n13), .Y(n1) );
  XOR2X1 U168 ( .A(n11), .B(n55), .Y(DIFF[1]) );
  XNOR2X1 U169 ( .A(A[0]), .B(n78), .Y(DIFF[0]) );
  INVX1 U170 ( .A(B[11]), .Y(n67) );
endmodule


module CS_DW01_sub_24 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17,
         n18, n19, n21, n22, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34,
         n35, n37, n39, n40, n41, n42, n43, n45, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n58, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n121, n122, n123, n124, n125, n126, n127, n128;

  XOR2X4 U1 ( .A(n14), .B(n1), .Y(DIFF[11]) );
  AOI21X4 U7 ( .A0(n15), .A1(n24), .B0(n16), .Y(n14) );
  BUFX4 U94 ( .A(n23), .Y(n121) );
  BUFX4 U95 ( .A(n22), .Y(n122) );
  BUFX3 U96 ( .A(n33), .Y(n123) );
  OAI21X4 U97 ( .A0(n17), .A1(n121), .B0(n18), .Y(n16) );
  NOR2X2 U98 ( .A(n122), .B(n17), .Y(n15) );
  AOI21X2 U99 ( .A0(n48), .A1(n125), .B0(n45), .Y(n43) );
  NOR2X1 U100 ( .A(A[1]), .B(n77), .Y(n53) );
  NAND2X1 U101 ( .A(A[7]), .B(n71), .Y(n31) );
  NOR2X4 U102 ( .A(A[10]), .B(n68), .Y(n17) );
  NOR2X2 U103 ( .A(A[0]), .B(n78), .Y(n55) );
  NAND2X1 U104 ( .A(A[3]), .B(n75), .Y(n47) );
  NAND2X1 U105 ( .A(A[9]), .B(n69), .Y(n23) );
  NAND2BX1 U106 ( .AN(n17), .B(n18), .Y(n2) );
  NAND2BX1 U107 ( .AN(n53), .B(n54), .Y(n11) );
  AOI21X4 U108 ( .A0(n126), .A1(n32), .B0(n29), .Y(n27) );
  INVX1 U109 ( .A(n31), .Y(n29) );
  NAND2BX1 U110 ( .AN(n41), .B(n42), .Y(n8) );
  NAND2BX1 U111 ( .AN(n49), .B(n50), .Y(n10) );
  NOR2BX1 U112 ( .AN(n34), .B(n123), .Y(n124) );
  NAND2X1 U113 ( .A(n58), .B(n121), .Y(n3) );
  INVX1 U114 ( .A(n122), .Y(n58) );
  NOR2X1 U115 ( .A(A[9]), .B(n69), .Y(n22) );
  OAI21X4 U116 ( .A0(n35), .A1(n123), .B0(n34), .Y(n32) );
  AOI21X4 U117 ( .A0(n127), .A1(n40), .B0(n37), .Y(n35) );
  OAI21X2 U118 ( .A0(n49), .A1(n51), .B0(n50), .Y(n48) );
  NOR2X1 U119 ( .A(A[2]), .B(n76), .Y(n49) );
  XNOR2X1 U120 ( .A(n3), .B(n24), .Y(DIFF[9]) );
  AOI21X1 U121 ( .A0(n24), .A1(n58), .B0(n21), .Y(n19) );
  OR2X1 U122 ( .A(A[7]), .B(n71), .Y(n126) );
  NAND2XL U123 ( .A(n126), .B(n31), .Y(n5) );
  OAI21X4 U124 ( .A0(n27), .A1(n25), .B0(n26), .Y(n24) );
  NOR2X1 U125 ( .A(A[4]), .B(n74), .Y(n41) );
  OR2X2 U126 ( .A(A[3]), .B(n75), .Y(n125) );
  INVX1 U127 ( .A(B[0]), .Y(n78) );
  INVX1 U128 ( .A(B[5]), .Y(n73) );
  XOR2XL U129 ( .A(n8), .B(n43), .Y(DIFF[4]) );
  INVX1 U130 ( .A(B[3]), .Y(n75) );
  INVX1 U131 ( .A(B[1]), .Y(n77) );
  INVX1 U132 ( .A(B[2]), .Y(n76) );
  INVX1 U133 ( .A(B[4]), .Y(n74) );
  INVX1 U134 ( .A(B[6]), .Y(n72) );
  INVX1 U135 ( .A(B[7]), .Y(n71) );
  INVX1 U136 ( .A(B[8]), .Y(n70) );
  OAI21X2 U137 ( .A0(n43), .A1(n41), .B0(n42), .Y(n40) );
  OR2X1 U138 ( .A(A[5]), .B(n73), .Y(n127) );
  NAND2X2 U139 ( .A(n128), .B(n13), .Y(n1) );
  INVX1 U140 ( .A(B[10]), .Y(n68) );
  INVX1 U141 ( .A(B[9]), .Y(n69) );
  INVX1 U142 ( .A(B[11]), .Y(n67) );
  NAND2BXL U143 ( .AN(n25), .B(n26), .Y(n4) );
  XNOR2XL U144 ( .A(n124), .B(n35), .Y(DIFF[6]) );
  XNOR2XL U145 ( .A(n9), .B(n48), .Y(DIFF[3]) );
  XOR2XL U146 ( .A(n10), .B(n51), .Y(DIFF[2]) );
  NAND2XL U147 ( .A(A[11]), .B(n67), .Y(n13) );
  OR2XL U148 ( .A(A[11]), .B(n67), .Y(n128) );
  NAND2XL U149 ( .A(A[1]), .B(n77), .Y(n54) );
  NAND2XL U150 ( .A(A[4]), .B(n74), .Y(n42) );
  NAND2XL U151 ( .A(A[10]), .B(n68), .Y(n18) );
  NAND2XL U152 ( .A(A[6]), .B(n72), .Y(n34) );
  NAND2XL U153 ( .A(A[5]), .B(n73), .Y(n39) );
  NAND2XL U154 ( .A(A[2]), .B(n76), .Y(n50) );
  NAND2X1 U155 ( .A(n127), .B(n39), .Y(n7) );
  INVX1 U156 ( .A(n47), .Y(n45) );
  INVX1 U157 ( .A(n39), .Y(n37) );
  INVX1 U158 ( .A(n52), .Y(n51) );
  OAI21XL U159 ( .A0(n53), .A1(n55), .B0(n54), .Y(n52) );
  XOR2X1 U160 ( .A(n19), .B(n2), .Y(DIFF[10]) );
  INVX1 U161 ( .A(n121), .Y(n21) );
  NAND2X1 U162 ( .A(n125), .B(n47), .Y(n9) );
  XOR2X1 U163 ( .A(n11), .B(n55), .Y(DIFF[1]) );
  NOR2X1 U164 ( .A(A[6]), .B(n72), .Y(n33) );
  NOR2X1 U165 ( .A(A[8]), .B(n70), .Y(n25) );
  NAND2X1 U166 ( .A(A[8]), .B(n70), .Y(n26) );
  XNOR2X1 U167 ( .A(A[0]), .B(n78), .Y(DIFF[0]) );
  XNOR2XL U168 ( .A(n5), .B(n32), .Y(DIFF[7]) );
  XOR2XL U169 ( .A(n4), .B(n27), .Y(DIFF[8]) );
  XNOR2XL U170 ( .A(n7), .B(n40), .Y(DIFF[5]) );
endmodule


module CS_DW01_sub_21 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n5, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17, n18, n19,
         n21, n22, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34, n35, n37,
         n39, n40, n41, n42, n43, n45, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n58, n61, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n121, n122, n123, n124, n125, n126, n127;

  NOR2X1 U94 ( .A(A[0]), .B(n78), .Y(n55) );
  NAND2X1 U95 ( .A(A[3]), .B(n75), .Y(n47) );
  XNOR2X1 U96 ( .A(n19), .B(n121), .Y(DIFF[10]) );
  NOR2BX1 U97 ( .AN(n26), .B(n25), .Y(n122) );
  NOR2BX1 U98 ( .AN(n18), .B(n17), .Y(n121) );
  AOI21X1 U99 ( .A0(n125), .A1(n40), .B0(n37), .Y(n35) );
  NAND2BX1 U100 ( .AN(n53), .B(n54), .Y(n11) );
  NAND2BX1 U101 ( .AN(n49), .B(n50), .Y(n10) );
  NAND2BX1 U102 ( .AN(n41), .B(n42), .Y(n8) );
  OAI21X1 U103 ( .A0(n43), .A1(n41), .B0(n42), .Y(n40) );
  OAI21X2 U104 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  AOI21X2 U105 ( .A0(n126), .A1(n32), .B0(n29), .Y(n27) );
  OAI21XL U106 ( .A0(n53), .A1(n55), .B0(n54), .Y(n52) );
  NOR2X1 U107 ( .A(A[2]), .B(n76), .Y(n49) );
  NOR2X1 U108 ( .A(A[4]), .B(n74), .Y(n41) );
  OAI21X2 U109 ( .A0(n27), .A1(n25), .B0(n26), .Y(n24) );
  OR2X1 U110 ( .A(A[3]), .B(n75), .Y(n124) );
  INVX1 U111 ( .A(B[2]), .Y(n76) );
  INVX1 U112 ( .A(B[0]), .Y(n78) );
  INVX1 U113 ( .A(B[4]), .Y(n74) );
  INVX1 U114 ( .A(B[5]), .Y(n73) );
  INVX1 U115 ( .A(B[1]), .Y(n77) );
  INVX1 U116 ( .A(B[7]), .Y(n71) );
  INVX1 U117 ( .A(B[6]), .Y(n72) );
  INVX1 U118 ( .A(B[3]), .Y(n75) );
  INVX1 U119 ( .A(B[9]), .Y(n69) );
  XNOR2X1 U120 ( .A(n3), .B(n24), .Y(DIFF[9]) );
  NAND2X1 U121 ( .A(n58), .B(n23), .Y(n3) );
  AOI21X2 U122 ( .A0(n48), .A1(n124), .B0(n45), .Y(n43) );
  NOR2X1 U123 ( .A(A[1]), .B(n77), .Y(n53) );
  OAI21X2 U124 ( .A0(n49), .A1(n51), .B0(n50), .Y(n48) );
  AND2X1 U125 ( .A(n61), .B(n34), .Y(n123) );
  INVX1 U126 ( .A(B[8]), .Y(n70) );
  INVX1 U127 ( .A(B[10]), .Y(n68) );
  XNOR2XL U128 ( .A(n122), .B(n27), .Y(DIFF[8]) );
  XNOR2XL U129 ( .A(n5), .B(n32), .Y(DIFF[7]) );
  AOI21XL U130 ( .A0(n15), .A1(n24), .B0(n16), .Y(n14) );
  XNOR2XL U131 ( .A(n9), .B(n48), .Y(DIFF[3]) );
  XOR2XL U132 ( .A(n8), .B(n43), .Y(DIFF[4]) );
  XNOR2XL U133 ( .A(n7), .B(n40), .Y(DIFF[5]) );
  XNOR2XL U134 ( .A(n123), .B(n35), .Y(DIFF[6]) );
  XOR2XL U135 ( .A(n10), .B(n51), .Y(DIFF[2]) );
  NAND2XL U136 ( .A(A[1]), .B(n77), .Y(n54) );
  NOR2XL U137 ( .A(A[10]), .B(n68), .Y(n17) );
  NOR2XL U138 ( .A(A[9]), .B(n69), .Y(n22) );
  NAND2XL U139 ( .A(A[9]), .B(n69), .Y(n23) );
  NAND2XL U140 ( .A(A[5]), .B(n73), .Y(n39) );
  NAND2XL U141 ( .A(A[8]), .B(n70), .Y(n26) );
  NAND2XL U142 ( .A(A[6]), .B(n72), .Y(n34) );
  NAND2XL U143 ( .A(A[10]), .B(n68), .Y(n18) );
  NAND2XL U144 ( .A(A[4]), .B(n74), .Y(n42) );
  NAND2XL U145 ( .A(A[2]), .B(n76), .Y(n50) );
  OR2XL U146 ( .A(A[5]), .B(n73), .Y(n125) );
  NAND2XL U147 ( .A(A[7]), .B(n71), .Y(n31) );
  NAND2XL U148 ( .A(A[11]), .B(n67), .Y(n13) );
  OR2XL U149 ( .A(A[7]), .B(n71), .Y(n126) );
  OR2XL U150 ( .A(A[11]), .B(n67), .Y(n127) );
  INVX1 U151 ( .A(n39), .Y(n37) );
  INVX1 U152 ( .A(n31), .Y(n29) );
  INVX1 U153 ( .A(n47), .Y(n45) );
  AOI21X1 U154 ( .A0(n24), .A1(n58), .B0(n21), .Y(n19) );
  INVX1 U155 ( .A(n52), .Y(n51) );
  INVX1 U156 ( .A(n22), .Y(n58) );
  INVX1 U157 ( .A(n23), .Y(n21) );
  NAND2X1 U158 ( .A(n124), .B(n47), .Y(n9) );
  OAI21XL U159 ( .A0(n17), .A1(n23), .B0(n18), .Y(n16) );
  NAND2X1 U160 ( .A(n125), .B(n39), .Y(n7) );
  INVX1 U161 ( .A(n33), .Y(n61) );
  NOR2X1 U162 ( .A(n22), .B(n17), .Y(n15) );
  NAND2X1 U163 ( .A(n126), .B(n31), .Y(n5) );
  XOR2X1 U164 ( .A(n14), .B(n1), .Y(DIFF[11]) );
  NAND2X1 U165 ( .A(n127), .B(n13), .Y(n1) );
  XOR2X1 U166 ( .A(n11), .B(n55), .Y(DIFF[1]) );
  NOR2X1 U167 ( .A(A[6]), .B(n72), .Y(n33) );
  NOR2X1 U168 ( .A(A[8]), .B(n70), .Y(n25) );
  XNOR2X1 U169 ( .A(A[0]), .B(n78), .Y(DIFF[0]) );
  INVX1 U170 ( .A(B[11]), .Y(n67) );
endmodule


module CS_DW01_sub_25 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15, n16, n17,
         n18, n19, n21, n22, n23, n24, n25, n26, n27, n29, n31, n32, n33, n34,
         n35, n37, n39, n40, n41, n42, n43, n45, n47, n48, n49, n50, n51, n53,
         n54, n55, n58, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n121, n122, n123, n124, n125, n126;

  AOI21X4 U7 ( .A0(n15), .A1(n24), .B0(n16), .Y(n14) );
  NOR2X1 U94 ( .A(A[1]), .B(n77), .Y(n53) );
  NOR2X1 U95 ( .A(A[8]), .B(n70), .Y(n25) );
  OAI21X2 U96 ( .A0(n122), .A1(n23), .B0(n18), .Y(n16) );
  BUFX4 U97 ( .A(n17), .Y(n122) );
  NOR2X2 U98 ( .A(A[0]), .B(n78), .Y(n55) );
  NAND2BX1 U99 ( .AN(n25), .B(n26), .Y(n4) );
  NAND2BXL U100 ( .AN(n17), .B(n18), .Y(n2) );
  OAI21XL U101 ( .A0(n53), .A1(n55), .B0(n54), .Y(n121) );
  INVX1 U102 ( .A(n121), .Y(n51) );
  NAND2BX1 U103 ( .AN(n41), .B(n42), .Y(n8) );
  NAND2BX1 U104 ( .AN(n53), .B(n54), .Y(n11) );
  AOI21X2 U105 ( .A0(n125), .A1(n32), .B0(n29), .Y(n27) );
  OAI21X4 U106 ( .A0(n27), .A1(n25), .B0(n26), .Y(n24) );
  NAND2BX1 U107 ( .AN(n49), .B(n50), .Y(n10) );
  OR2X2 U108 ( .A(A[11]), .B(n67), .Y(n126) );
  OAI21X4 U109 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  AOI21X4 U110 ( .A0(n124), .A1(n40), .B0(n37), .Y(n35) );
  OAI21X1 U111 ( .A0(n49), .A1(n51), .B0(n50), .Y(n48) );
  NOR2X1 U112 ( .A(A[10]), .B(n68), .Y(n17) );
  NOR2X1 U113 ( .A(n22), .B(n122), .Y(n15) );
  NAND2X1 U114 ( .A(A[3]), .B(n75), .Y(n47) );
  OR2X1 U115 ( .A(A[3]), .B(n75), .Y(n123) );
  INVX1 U116 ( .A(B[0]), .Y(n78) );
  INVX1 U117 ( .A(B[1]), .Y(n77) );
  INVX1 U118 ( .A(B[2]), .Y(n76) );
  INVX1 U119 ( .A(B[4]), .Y(n74) );
  AOI21X2 U120 ( .A0(n48), .A1(n123), .B0(n45), .Y(n43) );
  INVX1 U121 ( .A(n31), .Y(n29) );
  XOR2X1 U122 ( .A(n19), .B(n2), .Y(DIFF[10]) );
  XNOR2X1 U123 ( .A(n3), .B(n24), .Y(DIFF[9]) );
  NAND2X1 U124 ( .A(n58), .B(n23), .Y(n3) );
  NAND2X1 U125 ( .A(A[9]), .B(n69), .Y(n23) );
  NOR2X1 U126 ( .A(A[9]), .B(n69), .Y(n22) );
  AOI21X1 U127 ( .A0(n24), .A1(n58), .B0(n21), .Y(n19) );
  XOR2X1 U128 ( .A(n8), .B(n43), .Y(DIFF[4]) );
  NAND2X1 U129 ( .A(A[7]), .B(n71), .Y(n31) );
  OR2X1 U130 ( .A(A[7]), .B(n71), .Y(n125) );
  NAND2X1 U131 ( .A(A[5]), .B(n73), .Y(n39) );
  OR2X1 U132 ( .A(A[5]), .B(n73), .Y(n124) );
  XOR2X4 U133 ( .A(n14), .B(n1), .Y(DIFF[11]) );
  OAI21X2 U134 ( .A0(n43), .A1(n41), .B0(n42), .Y(n40) );
  NAND2XL U135 ( .A(A[1]), .B(n77), .Y(n54) );
  NAND2XL U136 ( .A(A[11]), .B(n67), .Y(n13) );
  NAND2XL U137 ( .A(A[4]), .B(n74), .Y(n42) );
  NAND2XL U138 ( .A(A[2]), .B(n76), .Y(n50) );
  INVX1 U139 ( .A(B[3]), .Y(n75) );
  XOR2XL U140 ( .A(n4), .B(n27), .Y(DIFF[8]) );
  NOR2X1 U141 ( .A(A[2]), .B(n76), .Y(n49) );
  NOR2X1 U142 ( .A(A[4]), .B(n74), .Y(n41) );
  INVX1 U143 ( .A(B[5]), .Y(n73) );
  INVX1 U144 ( .A(B[7]), .Y(n71) );
  INVX1 U145 ( .A(B[6]), .Y(n72) );
  XNOR2XL U146 ( .A(n7), .B(n40), .Y(DIFF[5]) );
  NAND2BXL U147 ( .AN(n33), .B(n34), .Y(n6) );
  XNOR2XL U148 ( .A(n9), .B(n48), .Y(DIFF[3]) );
  XOR2XL U149 ( .A(n10), .B(n51), .Y(DIFF[2]) );
  NAND2XL U150 ( .A(A[10]), .B(n68), .Y(n18) );
  NAND2XL U151 ( .A(A[6]), .B(n72), .Y(n34) );
  NAND2XL U152 ( .A(A[8]), .B(n70), .Y(n26) );
  NAND2X1 U153 ( .A(n125), .B(n31), .Y(n5) );
  INVX1 U154 ( .A(n47), .Y(n45) );
  INVX1 U155 ( .A(n39), .Y(n37) );
  INVX1 U156 ( .A(n22), .Y(n58) );
  INVX1 U157 ( .A(n23), .Y(n21) );
  NAND2X1 U158 ( .A(n126), .B(n13), .Y(n1) );
  NAND2X1 U159 ( .A(n124), .B(n39), .Y(n7) );
  NAND2X1 U160 ( .A(n123), .B(n47), .Y(n9) );
  XOR2X1 U161 ( .A(n11), .B(n55), .Y(DIFF[1]) );
  NOR2X1 U162 ( .A(A[6]), .B(n72), .Y(n33) );
  XNOR2X1 U163 ( .A(A[0]), .B(n78), .Y(DIFF[0]) );
  INVX1 U164 ( .A(B[8]), .Y(n70) );
  INVX1 U165 ( .A(B[9]), .Y(n69) );
  INVX1 U166 ( .A(B[10]), .Y(n68) );
  INVX1 U167 ( .A(B[11]), .Y(n67) );
  XOR2XL U168 ( .A(n6), .B(n35), .Y(DIFF[6]) );
  XNOR2XL U169 ( .A(n5), .B(n32), .Y(DIFF[7]) );
endmodule


module CS_DW01_add_4 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n26, n28, n29, n31, n33, n34, n35,
         n37, n39, n40, n41, n42, n43, n45, n47, n48, n49, n50, n51, n56, n57,
         n58, n59, n61, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120;

  BUFX8 U82 ( .A(n20), .Y(n111) );
  NAND2XL U83 ( .A(B[9]), .B(A[9]), .Y(n20) );
  OAI21X4 U84 ( .A0(n21), .A1(n19), .B0(n111), .Y(n18) );
  NOR2X2 U85 ( .A(n115), .B(n19), .Y(n14) );
  NOR2X2 U86 ( .A(B[9]), .B(A[9]), .Y(n19) );
  NOR2X1 U87 ( .A(B[3]), .B(A[3]), .Y(n49) );
  BUFX3 U88 ( .A(n16), .Y(n115) );
  NAND2X2 U89 ( .A(n117), .B(n120), .Y(n23) );
  OAI21X2 U90 ( .A0(n41), .A1(n43), .B0(n42), .Y(n40) );
  NAND2BX1 U91 ( .AN(n11), .B(n12), .Y(n1) );
  OAI21X2 U92 ( .A0(n51), .A1(n49), .B0(n50), .Y(n48) );
  NAND2BX1 U93 ( .AN(n49), .B(n50), .Y(n9) );
  NAND2BX1 U94 ( .AN(n41), .B(n42), .Y(n7) );
  NAND2XL U95 ( .A(n119), .B(n39), .Y(n6) );
  NAND2X1 U96 ( .A(B[4]), .B(A[4]), .Y(n47) );
  NAND2X1 U97 ( .A(B[7]), .B(A[7]), .Y(n33) );
  NOR2X1 U98 ( .A(B[5]), .B(A[5]), .Y(n41) );
  INVX2 U99 ( .A(n35), .Y(n34) );
  AOI21X4 U100 ( .A0(n40), .A1(n119), .B0(n37), .Y(n35) );
  NAND2X1 U101 ( .A(B[3]), .B(A[3]), .Y(n50) );
  NAND2XL U102 ( .A(B[0]), .B(A[0]), .Y(n59) );
  CLKINVX3 U103 ( .A(n28), .Y(n26) );
  AOI21X2 U104 ( .A0(n48), .A1(n118), .B0(n45), .Y(n43) );
  XNOR2X1 U105 ( .A(n6), .B(n40), .Y(SUM[6]) );
  XOR2X1 U106 ( .A(n18), .B(n116), .Y(SUM[10]) );
  OR2XL U107 ( .A(B[2]), .B(A[2]), .Y(n112) );
  AND2X2 U108 ( .A(B[2]), .B(A[2]), .Y(n113) );
  AOI21X4 U109 ( .A0(n14), .A1(n22), .B0(n15), .Y(n13) );
  OAI21X2 U110 ( .A0(n115), .A1(n111), .B0(n17), .Y(n15) );
  OAI21X1 U111 ( .A0(n57), .A1(n59), .B0(n58), .Y(n56) );
  NAND2X2 U112 ( .A(B[8]), .B(A[8]), .Y(n28) );
  NOR2X1 U113 ( .A(B[10]), .B(A[10]), .Y(n16) );
  INVX4 U114 ( .A(n22), .Y(n21) );
  OR2X4 U115 ( .A(B[8]), .B(A[8]), .Y(n117) );
  OR2XL U116 ( .A(B[9]), .B(A[9]), .Y(n114) );
  NAND2XL U117 ( .A(n114), .B(n111), .Y(n3) );
  XNOR2XL U118 ( .A(n8), .B(n48), .Y(SUM[4]) );
  AOI21X2 U119 ( .A0(n56), .A1(n112), .B0(n113), .Y(n51) );
  OAI21X4 U120 ( .A0(n23), .A1(n35), .B0(n24), .Y(n22) );
  AOI21X2 U121 ( .A0(n117), .A1(n31), .B0(n26), .Y(n24) );
  NOR2XL U122 ( .A(B[1]), .B(A[1]), .Y(n57) );
  NAND2XL U123 ( .A(B[1]), .B(A[1]), .Y(n58) );
  NAND2XL U124 ( .A(B[10]), .B(A[10]), .Y(n17) );
  OR2XL U125 ( .A(B[4]), .B(A[4]), .Y(n118) );
  NAND2XL U126 ( .A(B[6]), .B(A[6]), .Y(n39) );
  NAND2XL U127 ( .A(B[5]), .B(A[5]), .Y(n42) );
  OR2XL U128 ( .A(B[6]), .B(A[6]), .Y(n119) );
  NOR2XL U129 ( .A(B[11]), .B(A[11]), .Y(n11) );
  NAND2XL U130 ( .A(n120), .B(n33), .Y(n5) );
  AND2X2 U131 ( .A(n61), .B(n17), .Y(n116) );
  XOR2XL U132 ( .A(n7), .B(n43), .Y(SUM[5]) );
  XOR2XL U133 ( .A(n9), .B(n51), .Y(SUM[3]) );
  NAND2XL U134 ( .A(B[11]), .B(A[11]), .Y(n12) );
  INVX1 U135 ( .A(n47), .Y(n45) );
  INVX1 U136 ( .A(n39), .Y(n37) );
  INVX1 U137 ( .A(n33), .Y(n31) );
  INVX1 U138 ( .A(n115), .Y(n61) );
  XNOR2X1 U139 ( .A(n34), .B(n5), .Y(SUM[7]) );
  XOR2X1 U140 ( .A(n13), .B(n1), .Y(SUM[11]) );
  XOR2X1 U141 ( .A(n29), .B(n4), .Y(SUM[8]) );
  AOI21X1 U142 ( .A0(n34), .A1(n120), .B0(n31), .Y(n29) );
  XOR2X1 U143 ( .A(n21), .B(n3), .Y(SUM[9]) );
  NAND2X1 U144 ( .A(n118), .B(n47), .Y(n8) );
  OR2X2 U145 ( .A(B[7]), .B(A[7]), .Y(n120) );
  NAND2XL U146 ( .A(n117), .B(n28), .Y(n4) );
  OAI21XL U147 ( .A0(n13), .A1(n11), .B0(n12), .Y(SUM[12]) );
endmodule


module CS ( Y, X, reset, clk );
  output [9:0] Y;
  input [7:0] X;
  input reset, clk;
  wire   N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, \C1[11] ,
         \C2[11] , \C3[11] , \C4[11] , \C5[11] , \C6[11] , \C7[11] , \C8[11] ,
         \C9[11] , \Y1[9] , \Y1[8] , \Y1[7] , \Y1[6] , \Y1[5] , \Y1[4] ,
         \Y1[3] , \Y1[2] , \Y1[1] , \Y1[11] , \Y1[10] , \Y1[0] , N28, N24, N23,
         N22, N21, N20, N19, N18, N17, \mult_50_S3/n8 , \mult_50_S3/n7 ,
         \mult_50_S3/n6 , \mult_50_S3/n5 , \mult_50_S3/n4 , \mult_50_S3/n3 ,
         \mult_50_S3/n2 , n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n386, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n471, n472, n473, n474, n475, n476,
         n477, n478, n479, n480, n481, n482, n483, n484, n485, n486, n487,
         n488, n489, n490, n491, n492, n493, n494, n495, n496, n497, n498,
         n499, n500, n501, n502, n503, n504, n505, n506, n507, n508, n509,
         n510, n511, n512, n513, n514, n515, n516, n517, n518, n519, n520,
         n521, n522, n523, n524, n525, n526, n527, n528, n529, n530, n531,
         n532, n533, n534, n535, n536, n537, n538, n539, n540, n541, n542,
         n543, n544, n545, n546, n547, n548, n549, n550, n551, n552, n553,
         n554, n555, n556, n557, n558, n559, n560, n561, n562, n563, n564,
         n565, n566, n567, n568, n569, n570, n571, n572, n573, n574, n575,
         n576, n577, n578, n579, n580, n581, n582, n583, n584, n585, n586,
         n587, n588, n589, n590, n591, n592, n593, n594, n595, n596, n597,
         n598, n599, n600, n601, n602, n603, n604, n605, n606, n607, n608,
         n609, n610, n611, n612, n613, n614, n615, n616, n617, n618, n619,
         n620, n621, n622, n623, n624, n625, n626, n627, n628, n629, n630,
         n631, n632, n633, n634, n635, n636, n637, n638, n639, n640, n641,
         n642, n643, n644, n645, n646, n647, n648, n649, n650, n651, n652,
         n653, n654, n655, n656, n657, n658, n659, n660, n661, n662, n663,
         n664, n665, n666, n667, n668, n669, n670, n671, n672, n673, n674,
         n675, n676, n677, n678, n679, n680, n681, n682, n683, n684, n685,
         n686, n687, n688, n689, n690, n691, n692, n693, n694, n695, n696,
         n697, n698, n699, n700, n701, n702, n703, n704, n705, n706, n707,
         n708, n709, n710, n711, n712, n713, n714, n715, n716, n717, n718,
         n719, n720, n721, n722, n723, n724, n725, n726, n727, n728, n729,
         n730, n731, n732, n733, n734, n735, n736, n737, n738, n739, n740,
         n741, n742, n743, n744, n745, n746, n747, n748, n749, n750, n751,
         n752, n753, n754, n755, n756, n757, n758, n759, n760, n761, n762,
         n763, n764, n765, n766, n767, n768, n769, n770, n771, n772, n773,
         n774, n775, n776, n777, n778, n779, n780, n781, n782, n783, n784,
         n785, n786, n787, n788, n789, n790, n791, n792, n793, n794, n795,
         n796, n797, n798, n799, n800, n801, n802, n803, n804, n805, n806,
         n807, n808, n809, n810, n811, n812, n813, n814, n815, n816, n817,
         n818, n819, n820, n821, n822, n823, n824, n825, n826, n827, n828,
         n829, n830, n831, n832, n833, n834, n835, n836, n837, n838, n839,
         n840, n841, n842, n843, n844, n845, n846, n847, n848, n849, n850,
         n851, n852, n853, n854, n855, n856, n857, n858, n859, n860, n861,
         n862, n863, n864, n865, n866, n867, n868, n869, n870, n871, n872,
         n873, n874, n875, n876, n877, n878, n879, n880, n881, n882, n883,
         n884, n885, n886, n887, n888, n889, n890, n891, n892, n893, n894,
         n895, n896, n897, n898, n899, n900, n901, n902, n903, n904, n905,
         n906, n907, n908, n909, n910, n911, n912, n913, n914, n915, n916,
         n917, n918, n919, n920, n921, n922, n923, n924, n925, n926, n927,
         n928, n929, n930, n931, n932, n933, n934, n935, n936, n937, n938,
         n939, n940, n941, n942, n943, n944, n945, n946, n947, n948, n949,
         n950, n951, n952, n953, n954, n955, n956, n957, n958, n959, n960,
         n961, n962, n963, n964, n965, n966, n967, n968, n969, n970, n971,
         n972, n973, n974, n975, n976, n977, n978, n979, n980, n981, n982,
         n983, n984, n985, n986, n987, n988, n989, n990, n991, n992, n993,
         n994, n995, n996, n997, n998, n999, n1000;
  wire   [7:0] X9;
  wire   [11:0] Xt;
  wire   [7:0] X1_d;
  wire   [11:0] Xt_temp;
  wire   [11:0] S1;
  wire   [11:0] C1_temp;
  wire   [11:0] S2;
  wire   [11:0] C2_temp;
  wire   [11:0] S3;
  wire   [11:0] C3_temp;
  wire   [11:0] S4;
  wire   [11:0] C4_temp;
  wire   [11:0] S5;
  wire   [11:0] C5_temp;
  wire   [11:0] S6;
  wire   [11:0] C6_temp;
  wire   [11:0] S7;
  wire   [11:0] C7_temp;
  wire   [11:0] S8;
  wire   [11:0] C8_temp;
  wire   [11:0] S9;
  wire   [11:0] C9_temp;
  wire   [7:0] X1;
  wire   [7:0] X2;
  wire   [7:0] X3;
  wire   [7:0] X4;
  wire   [7:0] X5;
  wire   [7:0] X6;
  wire   [7:0] X7;
  wire   [7:0] X8;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2;
  assign N30 = X[0];
  assign N31 = X[1];
  assign N32 = X[2];

  DFFRHQX4 \X9_reg[3]  ( .D(n359), .CK(clk), .RN(n1000), .Q(X9[3]) );
  CS_DW01_sub_0 sub_18 ( .A({n409, n408, n407, n406, n405, n340, n404, n403, 
        n402, n401, n400, n399}), .B(S9), .CI(1'b0), .DIFF({\C9[11] , 
        C9_temp[10:0]}) );
  ADDHXL \mult_50_S3/U9  ( .A(n347), .B(n359), .CO(\mult_50_S3/n8 ), .S(N33)
         );
  ADDFX2 \mult_50_S3/U8  ( .A(n361), .B(n349), .CI(\mult_50_S3/n8 ), .CO(
        \mult_50_S3/n7 ), .S(N34) );
  ADDFX2 \mult_50_S3/U7  ( .A(n353), .B(n351), .CI(\mult_50_S3/n7 ), .CO(
        \mult_50_S3/n6 ), .S(N35) );
  ADDFX2 \mult_50_S3/U6  ( .A(n355), .B(n359), .CI(\mult_50_S3/n6 ), .CO(
        \mult_50_S3/n5 ), .S(N36) );
  ADDFX2 \mult_50_S3/U5  ( .A(n357), .B(n361), .CI(\mult_50_S3/n5 ), .CO(
        \mult_50_S3/n4 ), .S(N37) );
  ADDHXL \mult_50_S3/U4  ( .A(n353), .B(\mult_50_S3/n4 ), .CO(\mult_50_S3/n3 ), 
        .S(N38) );
  ADDHXL \mult_50_S3/U3  ( .A(n355), .B(\mult_50_S3/n3 ), .CO(\mult_50_S3/n2 ), 
        .S(N39) );
  ADDHXL \mult_50_S3/U2  ( .A(n357), .B(\mult_50_S3/n2 ), .CO(N41), .S(N40) );
  CS_DW01_add_5 add_0_root_sub_0_root_sub_9 ( .A(Xt), .B({N28, N28, N28, N28, 
        N24, N23, N22, N21, N20, N19, N18, N17}), .CI(1'b0), .SUM(Xt_temp) );
  CS_DW01_sub_18 sub_17 ( .A({n409, n408, n407, n406, n405, n340, n404, n403, 
        n402, n401, n400, n399}), .B(S8), .CI(1'b0), .DIFF({\C8[11] , 
        C8_temp[10:0]}) );
  CS_DW01_sub_22 sub_16 ( .A({n409, n408, n407, n406, n405, n340, n404, n403, 
        n402, n401, n400, n399}), .B(S7), .CI(1'b0), .DIFF({\C7[11] , 
        C7_temp[10:0]}) );
  CS_DW01_sub_19 sub_15 ( .A({n409, n408, n407, n406, n405, n340, n404, n403, 
        n402, n401, n400, n399}), .B(S6), .CI(1'b0), .DIFF({\C6[11] , 
        C6_temp[10:0]}) );
  CS_DW01_sub_23 sub_14 ( .A({n409, n408, n407, n406, n405, n340, n404, n403, 
        n402, n401, n400, n399}), .B(S5), .CI(1'b0), .DIFF({\C5[11] , 
        C5_temp[10:0]}) );
  CS_DW01_sub_20 sub_13 ( .A({n409, n408, n407, n406, n405, n340, n404, n403, 
        n402, n401, n400, n399}), .B(S4), .CI(1'b0), .DIFF({\C4[11] , 
        C4_temp[10:0]}) );
  CS_DW01_sub_24 sub_12 ( .A({n409, n408, n407, n406, n405, n340, n404, n403, 
        n402, n401, n400, n399}), .B(S3), .CI(1'b0), .DIFF({\C3[11] , 
        C3_temp[10:0]}) );
  CS_DW01_sub_21 sub_11 ( .A({n409, n408, n407, n406, n405, n340, n404, n403, 
        n402, n401, n400, n399}), .B(S2), .CI(1'b0), .DIFF({\C2[11] , 
        C2_temp[10:0]}) );
  CS_DW01_sub_25 sub_10 ( .A({n409, n408, n407, n406, n405, n340, n404, n403, 
        n402, n401, n400, n399}), .B(S1), .CI(1'b0), .DIFF({\C1[11] , 
        C1_temp[10:0]}) );
  CS_DW01_add_4 add_23 ( .A({1'b0, n409, n408, n407, n406, n405, n340, n404, 
        n403, n402, n401, n400, n399}), .B({1'b0, \Y1[11] , \Y1[10] , \Y1[9] , 
        \Y1[8] , \Y1[7] , \Y1[6] , \Y1[5] , \Y1[4] , \Y1[3] , \Y1[2] , \Y1[1] , 
        \Y1[0] }), .CI(1'b0), .SUM({Y, SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2}) );
  DFFRHQXL \X7_reg[7]  ( .D(X8[7]), .CK(clk), .RN(n1000), .Q(X7[7]) );
  DFFRHQXL \X5_reg[7]  ( .D(X6[7]), .CK(clk), .RN(n418), .Q(X5[7]) );
  DFFRHQXL \X3_reg[7]  ( .D(X4[7]), .CK(clk), .RN(n418), .Q(X3[7]) );
  DFFRHQXL \X1_reg[7]  ( .D(X2[7]), .CK(clk), .RN(n414), .Q(X1[7]) );
  DFFRHQXL \X7_reg[6]  ( .D(X8[6]), .CK(clk), .RN(n418), .Q(X7[6]) );
  DFFRHQXL \X5_reg[6]  ( .D(X6[6]), .CK(clk), .RN(n418), .Q(X5[6]) );
  DFFRHQXL \X3_reg[6]  ( .D(X4[6]), .CK(clk), .RN(n418), .Q(X3[6]) );
  DFFRHQXL \X1_reg[6]  ( .D(X2[6]), .CK(clk), .RN(n417), .Q(X1[6]) );
  DFFRHQXL \X7_reg[5]  ( .D(X8[5]), .CK(clk), .RN(n418), .Q(X7[5]) );
  DFFRHQXL \X5_reg[5]  ( .D(X6[5]), .CK(clk), .RN(n419), .Q(X5[5]) );
  DFFRHQXL \X3_reg[5]  ( .D(X4[5]), .CK(clk), .RN(n419), .Q(X3[5]) );
  DFFRHQXL \X1_reg[5]  ( .D(X2[5]), .CK(clk), .RN(n417), .Q(X1[5]) );
  DFFRHQXL \X7_reg[4]  ( .D(X8[4]), .CK(clk), .RN(n419), .Q(X7[4]) );
  DFFRHQXL \X5_reg[4]  ( .D(X6[4]), .CK(clk), .RN(n419), .Q(X5[4]) );
  DFFRHQXL \X3_reg[4]  ( .D(X4[4]), .CK(clk), .RN(n417), .Q(X3[4]) );
  DFFRHQXL \X1_reg[4]  ( .D(X2[4]), .CK(clk), .RN(n416), .Q(X1[4]) );
  DFFRHQXL \X7_reg[3]  ( .D(X8[3]), .CK(clk), .RN(n416), .Q(X7[3]) );
  DFFRHQXL \X5_reg[3]  ( .D(X6[3]), .CK(clk), .RN(n419), .Q(X5[3]) );
  DFFRHQXL \X3_reg[3]  ( .D(X4[3]), .CK(clk), .RN(n1000), .Q(X3[3]) );
  DFFRHQXL \X1_reg[3]  ( .D(X2[3]), .CK(clk), .RN(n417), .Q(X1[3]) );
  DFFRHQXL \X7_reg[2]  ( .D(X8[2]), .CK(clk), .RN(n420), .Q(X7[2]) );
  DFFRHQXL \X5_reg[2]  ( .D(X6[2]), .CK(clk), .RN(n418), .Q(X5[2]) );
  DFFRHQXL \X3_reg[2]  ( .D(X4[2]), .CK(clk), .RN(n420), .Q(X3[2]) );
  DFFRHQXL \X1_reg[2]  ( .D(X2[2]), .CK(clk), .RN(n417), .Q(X1[2]) );
  DFFRHQXL \X7_reg[1]  ( .D(X8[1]), .CK(clk), .RN(n420), .Q(X7[1]) );
  DFFRHQXL \X5_reg[1]  ( .D(X6[1]), .CK(clk), .RN(n420), .Q(X5[1]) );
  DFFRHQXL \X3_reg[1]  ( .D(X4[1]), .CK(clk), .RN(n420), .Q(X3[1]) );
  DFFRHQXL \X1_reg[1]  ( .D(X2[1]), .CK(clk), .RN(n417), .Q(X1[1]) );
  DFFRHQXL \X7_reg[0]  ( .D(X8[0]), .CK(clk), .RN(n419), .Q(X7[0]) );
  DFFRHQXL \X5_reg[0]  ( .D(X6[0]), .CK(clk), .RN(n420), .Q(X5[0]) );
  DFFRHQXL \X3_reg[0]  ( .D(X4[0]), .CK(clk), .RN(n413), .Q(X3[0]) );
  DFFRHQXL \X1_reg[0]  ( .D(X2[0]), .CK(clk), .RN(n1000), .Q(X1[0]) );
  DFFRHQXL \X8_reg[7]  ( .D(X9[7]), .CK(clk), .RN(n1000), .Q(X8[7]) );
  DFFRHQXL \X8_reg[6]  ( .D(X9[6]), .CK(clk), .RN(n418), .Q(X8[6]) );
  DFFRHQXL \X8_reg[5]  ( .D(n372), .CK(clk), .RN(n419), .Q(X8[5]) );
  DFFRHQXL \X8_reg[3]  ( .D(X9[3]), .CK(clk), .RN(n416), .Q(X8[3]) );
  DFFRHQXL \X8_reg[2]  ( .D(n303), .CK(clk), .RN(n420), .Q(X8[2]) );
  DFFRHQXL \X6_reg[7]  ( .D(X7[7]), .CK(clk), .RN(n1000), .Q(X6[7]) );
  DFFRHQXL \X4_reg[7]  ( .D(X5[7]), .CK(clk), .RN(n418), .Q(X4[7]) );
  DFFRHQXL \X2_reg[7]  ( .D(X3[7]), .CK(clk), .RN(n418), .Q(X2[7]) );
  DFFRHQXL \X6_reg[6]  ( .D(X7[6]), .CK(clk), .RN(n418), .Q(X6[6]) );
  DFFRHQXL \X4_reg[6]  ( .D(X5[6]), .CK(clk), .RN(n418), .Q(X4[6]) );
  DFFRHQXL \X2_reg[6]  ( .D(X3[6]), .CK(clk), .RN(n418), .Q(X2[6]) );
  DFFRHQXL \X6_reg[5]  ( .D(X7[5]), .CK(clk), .RN(n419), .Q(X6[5]) );
  DFFRHQXL \X4_reg[5]  ( .D(X5[5]), .CK(clk), .RN(n419), .Q(X4[5]) );
  DFFRHQXL \X2_reg[5]  ( .D(X3[5]), .CK(clk), .RN(n419), .Q(X2[5]) );
  DFFRHQXL \X6_reg[4]  ( .D(X7[4]), .CK(clk), .RN(n419), .Q(X6[4]) );
  DFFRHQXL \X4_reg[4]  ( .D(X5[4]), .CK(clk), .RN(n419), .Q(X4[4]) );
  DFFRHQXL \X2_reg[4]  ( .D(X3[4]), .CK(clk), .RN(n415), .Q(X2[4]) );
  DFFRHQXL \X6_reg[3]  ( .D(X7[3]), .CK(clk), .RN(n417), .Q(X6[3]) );
  DFFRHQXL \X4_reg[3]  ( .D(X5[3]), .CK(clk), .RN(n413), .Q(X4[3]) );
  DFFRHQXL \X2_reg[3]  ( .D(X3[3]), .CK(clk), .RN(n1000), .Q(X2[3]) );
  DFFRHQXL \X6_reg[2]  ( .D(X7[2]), .CK(clk), .RN(n1000), .Q(X6[2]) );
  DFFRHQXL \X4_reg[2]  ( .D(X5[2]), .CK(clk), .RN(n420), .Q(X4[2]) );
  DFFRHQXL \X2_reg[2]  ( .D(X3[2]), .CK(clk), .RN(n417), .Q(X2[2]) );
  DFFRHQXL \X6_reg[1]  ( .D(X7[1]), .CK(clk), .RN(n420), .Q(X6[1]) );
  DFFRHQXL \X4_reg[1]  ( .D(X5[1]), .CK(clk), .RN(n420), .Q(X4[1]) );
  DFFRHQXL \X2_reg[1]  ( .D(X3[1]), .CK(clk), .RN(n417), .Q(X2[1]) );
  DFFRHQXL \X6_reg[0]  ( .D(X7[0]), .CK(clk), .RN(n420), .Q(X6[0]) );
  DFFRHQXL \X4_reg[0]  ( .D(X5[0]), .CK(clk), .RN(n415), .Q(X4[0]) );
  DFFRHQXL \X2_reg[0]  ( .D(X3[0]), .CK(clk), .RN(n419), .Q(X2[0]) );
  DFFRHQXL \S9_reg[11]  ( .D(N41), .CK(clk), .RN(n420), .Q(S9[11]) );
  DFFRHQXL \S9_reg[10]  ( .D(N40), .CK(clk), .RN(n1000), .Q(S9[10]) );
  DFFRHQXL \S9_reg[9]  ( .D(N39), .CK(clk), .RN(n416), .Q(S9[9]) );
  DFFRHQXL \S9_reg[8]  ( .D(N38), .CK(clk), .RN(n416), .Q(S9[8]) );
  DFFRHQXL \S9_reg[7]  ( .D(N37), .CK(clk), .RN(n420), .Q(S9[7]) );
  DFFRHQXL \S9_reg[6]  ( .D(N36), .CK(clk), .RN(n415), .Q(S9[6]) );
  DFFRHQXL \S9_reg[5]  ( .D(N35), .CK(clk), .RN(n415), .Q(S9[5]) );
  DFFRHQXL \S9_reg[4]  ( .D(N34), .CK(clk), .RN(n414), .Q(S9[4]) );
  DFFRHQXL \S9_reg[3]  ( .D(N33), .CK(clk), .RN(n413), .Q(S9[3]) );
  DFFRHQX1 \S9_reg[2]  ( .D(n351), .CK(clk), .RN(n413), .Q(S9[2]) );
  DFFRHQX1 \S9_reg[1]  ( .D(n349), .CK(clk), .RN(n413), .Q(S9[1]) );
  DFFRHQX1 \S9_reg[0]  ( .D(n347), .CK(clk), .RN(n416), .Q(S9[0]) );
  DFFRHQXL \S8_reg[11]  ( .D(S9[11]), .CK(clk), .RN(n418), .Q(S8[11]) );
  DFFRHQXL \S6_reg[11]  ( .D(S7[11]), .CK(clk), .RN(n415), .Q(S6[11]) );
  DFFRHQXL \S4_reg[11]  ( .D(S5[11]), .CK(clk), .RN(n1000), .Q(S4[11]) );
  DFFRHQXL \S2_reg[11]  ( .D(S3[11]), .CK(clk), .RN(n414), .Q(S2[11]) );
  DFFRHQXL \S1_reg[11]  ( .D(S2[11]), .CK(clk), .RN(n417), .Q(S1[11]) );
  DFFRHQXL \S8_reg[10]  ( .D(S9[10]), .CK(clk), .RN(n420), .Q(S8[10]) );
  DFFRHQXL \S8_reg[9]  ( .D(S9[9]), .CK(clk), .RN(n416), .Q(S8[9]) );
  DFFRHQXL \S8_reg[8]  ( .D(S9[8]), .CK(clk), .RN(n416), .Q(S8[8]) );
  DFFRHQXL \S6_reg[10]  ( .D(S7[10]), .CK(clk), .RN(n419), .Q(S6[10]) );
  DFFRHQXL \S4_reg[10]  ( .D(S5[10]), .CK(clk), .RN(n418), .Q(S4[10]) );
  DFFRHQXL \S2_reg[10]  ( .D(S3[10]), .CK(clk), .RN(n420), .Q(S2[10]) );
  DFFRHQXL \S6_reg[9]  ( .D(S7[9]), .CK(clk), .RN(n416), .Q(S6[9]) );
  DFFRHQXL \S4_reg[9]  ( .D(S5[9]), .CK(clk), .RN(n416), .Q(S4[9]) );
  DFFRHQXL \S2_reg[9]  ( .D(S3[9]), .CK(clk), .RN(n416), .Q(S2[9]) );
  DFFRHQXL \S6_reg[8]  ( .D(S7[8]), .CK(clk), .RN(n418), .Q(S6[8]) );
  DFFRHQXL \S4_reg[8]  ( .D(S5[8]), .CK(clk), .RN(n416), .Q(S4[8]) );
  DFFRHQXL \S2_reg[8]  ( .D(S3[8]), .CK(clk), .RN(n415), .Q(S2[8]) );
  DFFRHQXL \S1_reg[10]  ( .D(S2[10]), .CK(clk), .RN(n416), .Q(S1[10]) );
  DFFRHQXL \S1_reg[9]  ( .D(S2[9]), .CK(clk), .RN(n416), .Q(S1[9]) );
  DFFRHQXL \S1_reg[8]  ( .D(S2[8]), .CK(clk), .RN(n1000), .Q(S1[8]) );
  DFFRHQXL \S1_reg[7]  ( .D(S2[7]), .CK(clk), .RN(n415), .Q(S1[7]) );
  DFFRHQXL \S1_reg[6]  ( .D(S2[6]), .CK(clk), .RN(n415), .Q(S1[6]) );
  DFFRHQXL \S1_reg[5]  ( .D(S2[5]), .CK(clk), .RN(n414), .Q(S1[5]) );
  DFFRHQXL \S8_reg[7]  ( .D(S9[7]), .CK(clk), .RN(n419), .Q(S8[7]) );
  DFFRHQXL \S8_reg[6]  ( .D(S9[6]), .CK(clk), .RN(n415), .Q(S8[6]) );
  DFFRHQXL \S8_reg[5]  ( .D(S9[5]), .CK(clk), .RN(n415), .Q(S8[5]) );
  DFFRHQXL \S8_reg[4]  ( .D(S9[4]), .CK(clk), .RN(n414), .Q(S8[4]) );
  DFFRHQXL \S7_reg[11]  ( .D(S8[11]), .CK(clk), .RN(n415), .Q(S7[11]) );
  DFFRHQXL \S5_reg[11]  ( .D(S6[11]), .CK(clk), .RN(n415), .Q(S5[11]) );
  DFFRHQXL \S3_reg[11]  ( .D(S4[11]), .CK(clk), .RN(n413), .Q(S3[11]) );
  DFFRHQXL \S7_reg[10]  ( .D(S8[10]), .CK(clk), .RN(n413), .Q(S7[10]) );
  DFFRHQXL \S5_reg[10]  ( .D(S6[10]), .CK(clk), .RN(n420), .Q(S5[10]) );
  DFFRHQXL \S3_reg[10]  ( .D(S4[10]), .CK(clk), .RN(n1000), .Q(S3[10]) );
  DFFRHQXL \S7_reg[9]  ( .D(S8[9]), .CK(clk), .RN(n416), .Q(S7[9]) );
  DFFRHQXL \S5_reg[9]  ( .D(S6[9]), .CK(clk), .RN(n416), .Q(S5[9]) );
  DFFRHQXL \S3_reg[9]  ( .D(S4[9]), .CK(clk), .RN(n416), .Q(S3[9]) );
  DFFRHQXL \S7_reg[8]  ( .D(S8[8]), .CK(clk), .RN(n416), .Q(S7[8]) );
  DFFRHQXL \S5_reg[8]  ( .D(S6[8]), .CK(clk), .RN(n414), .Q(S5[8]) );
  DFFRHQXL \S3_reg[8]  ( .D(S4[8]), .CK(clk), .RN(n413), .Q(S3[8]) );
  DFFRHQXL \S7_reg[7]  ( .D(S8[7]), .CK(clk), .RN(n417), .Q(S7[7]) );
  DFFRHQXL \S6_reg[7]  ( .D(S7[7]), .CK(clk), .RN(n420), .Q(S6[7]) );
  DFFRHQXL \S5_reg[7]  ( .D(S6[7]), .CK(clk), .RN(n418), .Q(S5[7]) );
  DFFRHQXL \S4_reg[7]  ( .D(S5[7]), .CK(clk), .RN(n416), .Q(S4[7]) );
  DFFRHQXL \S3_reg[7]  ( .D(S4[7]), .CK(clk), .RN(n415), .Q(S3[7]) );
  DFFRHQXL \S2_reg[7]  ( .D(S3[7]), .CK(clk), .RN(n415), .Q(S2[7]) );
  DFFRHQXL \S7_reg[6]  ( .D(S8[6]), .CK(clk), .RN(n415), .Q(S7[6]) );
  DFFRHQXL \S6_reg[6]  ( .D(S7[6]), .CK(clk), .RN(n415), .Q(S6[6]) );
  DFFRHQXL \S5_reg[6]  ( .D(S6[6]), .CK(clk), .RN(n415), .Q(S5[6]) );
  DFFRHQXL \S4_reg[6]  ( .D(S5[6]), .CK(clk), .RN(n415), .Q(S4[6]) );
  DFFRHQXL \S3_reg[6]  ( .D(S4[6]), .CK(clk), .RN(n415), .Q(S3[6]) );
  DFFRHQXL \S2_reg[6]  ( .D(S3[6]), .CK(clk), .RN(n415), .Q(S2[6]) );
  DFFRHQXL \S6_reg[5]  ( .D(S7[5]), .CK(clk), .RN(n414), .Q(S6[5]) );
  DFFRHQXL \S4_reg[5]  ( .D(S5[5]), .CK(clk), .RN(n414), .Q(S4[5]) );
  DFFRHQXL \S2_reg[5]  ( .D(S3[5]), .CK(clk), .RN(n414), .Q(S2[5]) );
  DFFRHQXL \S6_reg[4]  ( .D(S7[4]), .CK(clk), .RN(n414), .Q(S6[4]) );
  DFFRHQXL \S4_reg[4]  ( .D(S5[4]), .CK(clk), .RN(n414), .Q(S4[4]) );
  DFFRHQXL \S2_reg[4]  ( .D(S3[4]), .CK(clk), .RN(n413), .Q(S2[4]) );
  DFFRHQXL \Xt_reg[11]  ( .D(n409), .CK(clk), .RN(n1000), .Q(Xt[11]) );
  DFFRHQXL \S1_reg[4]  ( .D(S2[4]), .CK(clk), .RN(n413), .Q(S1[4]) );
  DFFRHQXL \S1_reg[3]  ( .D(S2[3]), .CK(clk), .RN(n413), .Q(S1[3]) );
  DFFRHQXL \S1_reg[2]  ( .D(S2[2]), .CK(clk), .RN(n415), .Q(S1[2]) );
  DFFRHQXL \S1_reg[1]  ( .D(S2[1]), .CK(clk), .RN(n414), .Q(S1[1]) );
  DFFRHQXL \S1_reg[0]  ( .D(S2[0]), .CK(clk), .RN(n420), .Q(S1[0]) );
  DFFRHQXL \S8_reg[3]  ( .D(S9[3]), .CK(clk), .RN(n413), .Q(S8[3]) );
  DFFRHQXL \S8_reg[2]  ( .D(S9[2]), .CK(clk), .RN(n1000), .Q(S8[2]) );
  DFFRHQXL \S8_reg[1]  ( .D(S9[1]), .CK(clk), .RN(n413), .Q(S8[1]) );
  DFFRHQXL \S8_reg[0]  ( .D(S9[0]), .CK(clk), .RN(n417), .Q(S8[0]) );
  DFFRHQXL \S7_reg[5]  ( .D(S8[5]), .CK(clk), .RN(n414), .Q(S7[5]) );
  DFFRHQXL \S5_reg[5]  ( .D(S6[5]), .CK(clk), .RN(n414), .Q(S5[5]) );
  DFFRHQXL \S3_reg[5]  ( .D(S4[5]), .CK(clk), .RN(n414), .Q(S3[5]) );
  DFFRHQXL \S7_reg[4]  ( .D(S8[4]), .CK(clk), .RN(n414), .Q(S7[4]) );
  DFFRHQXL \S5_reg[4]  ( .D(S6[4]), .CK(clk), .RN(n414), .Q(S5[4]) );
  DFFRHQXL \S3_reg[4]  ( .D(S4[4]), .CK(clk), .RN(n413), .Q(S3[4]) );
  DFFRHQXL \S7_reg[3]  ( .D(S8[3]), .CK(clk), .RN(n413), .Q(S7[3]) );
  DFFRHQXL \S6_reg[3]  ( .D(S7[3]), .CK(clk), .RN(n413), .Q(S6[3]) );
  DFFRHQXL \S5_reg[3]  ( .D(S6[3]), .CK(clk), .RN(n413), .Q(S5[3]) );
  DFFRHQXL \S4_reg[3]  ( .D(S5[3]), .CK(clk), .RN(n413), .Q(S4[3]) );
  DFFRHQXL \S3_reg[3]  ( .D(S4[3]), .CK(clk), .RN(n413), .Q(S3[3]) );
  DFFRHQXL \S2_reg[3]  ( .D(S3[3]), .CK(clk), .RN(n413), .Q(S2[3]) );
  DFFRHQXL \S7_reg[2]  ( .D(S8[2]), .CK(clk), .RN(n414), .Q(S7[2]) );
  DFFRHQXL \S6_reg[2]  ( .D(S7[2]), .CK(clk), .RN(n417), .Q(S6[2]) );
  DFFRHQXL \S5_reg[2]  ( .D(S6[2]), .CK(clk), .RN(n1000), .Q(S5[2]) );
  DFFRHQXL \S4_reg[2]  ( .D(S5[2]), .CK(clk), .RN(n414), .Q(S4[2]) );
  DFFRHQXL \S3_reg[2]  ( .D(S4[2]), .CK(clk), .RN(n418), .Q(S3[2]) );
  DFFRHQXL \S2_reg[2]  ( .D(S3[2]), .CK(clk), .RN(n419), .Q(S2[2]) );
  DFFRHQXL \S7_reg[1]  ( .D(S8[1]), .CK(clk), .RN(n418), .Q(S7[1]) );
  DFFRHQXL \S6_reg[1]  ( .D(S7[1]), .CK(clk), .RN(n1000), .Q(S6[1]) );
  DFFRHQXL \S5_reg[1]  ( .D(S6[1]), .CK(clk), .RN(n417), .Q(S5[1]) );
  DFFRHQXL \S4_reg[1]  ( .D(S5[1]), .CK(clk), .RN(n416), .Q(S4[1]) );
  DFFRHQXL \S3_reg[1]  ( .D(S4[1]), .CK(clk), .RN(n419), .Q(S3[1]) );
  DFFRHQXL \S2_reg[1]  ( .D(S3[1]), .CK(clk), .RN(n1000), .Q(S2[1]) );
  DFFRHQXL \S7_reg[0]  ( .D(S8[0]), .CK(clk), .RN(n420), .Q(S7[0]) );
  DFFRHQXL \S6_reg[0]  ( .D(S7[0]), .CK(clk), .RN(n1000), .Q(S6[0]) );
  DFFRHQXL \S5_reg[0]  ( .D(S6[0]), .CK(clk), .RN(n418), .Q(S5[0]) );
  DFFRHQXL \S4_reg[0]  ( .D(S5[0]), .CK(clk), .RN(n418), .Q(S4[0]) );
  DFFRHQXL \S3_reg[0]  ( .D(S4[0]), .CK(clk), .RN(n1000), .Q(S3[0]) );
  DFFRHQXL \S2_reg[0]  ( .D(S3[0]), .CK(clk), .RN(n415), .Q(S2[0]) );
  DFFRHQXL \Xt_reg[5]  ( .D(n404), .CK(clk), .RN(n1000), .Q(Xt[5]) );
  DFFRHQXL \Xt_reg[10]  ( .D(n408), .CK(clk), .RN(n1000), .Q(Xt[10]) );
  DFFRHQXL \Xt_reg[9]  ( .D(n407), .CK(clk), .RN(n418), .Q(Xt[9]) );
  DFFRHQXL \Xt_reg[8]  ( .D(n406), .CK(clk), .RN(n416), .Q(Xt[8]) );
  DFFRHQXL \Xt_reg[7]  ( .D(n405), .CK(clk), .RN(n415), .Q(Xt[7]) );
  DFFRHQXL \Xt_reg[6]  ( .D(n340), .CK(clk), .RN(n417), .Q(Xt[6]) );
  DFFRHQXL \X1_d_reg[7]  ( .D(X1[7]), .CK(clk), .RN(n413), .Q(X1_d[7]) );
  DFFRHQXL \Xt_reg[4]  ( .D(n403), .CK(clk), .RN(n414), .Q(Xt[4]) );
  DFFRHQXL \Xt_reg[3]  ( .D(n402), .CK(clk), .RN(n419), .Q(Xt[3]) );
  DFFRHQXL \Xt_reg[2]  ( .D(n401), .CK(clk), .RN(n417), .Q(Xt[2]) );
  DFFRHQXL \Xt_reg[1]  ( .D(n400), .CK(clk), .RN(n417), .Q(Xt[1]) );
  DFFRHQXL \Xt_reg[0]  ( .D(n399), .CK(clk), .RN(n417), .Q(Xt[0]) );
  DFFRHQXL \X1_d_reg[5]  ( .D(X1[5]), .CK(clk), .RN(n417), .Q(X1_d[5]) );
  DFFRHQXL \X1_d_reg[6]  ( .D(X1[6]), .CK(clk), .RN(n417), .Q(X1_d[6]) );
  DFFRHQX1 \X9_reg[5]  ( .D(n353), .CK(clk), .RN(n419), .Q(X9[5]) );
  DFFRHQX1 \X9_reg[7]  ( .D(n357), .CK(clk), .RN(n413), .Q(X9[7]) );
  DFFRHQX1 \X9_reg[6]  ( .D(n355), .CK(clk), .RN(n418), .Q(X9[6]) );
  DFFRHQXL \X1_d_reg[4]  ( .D(X1[4]), .CK(clk), .RN(n419), .Q(X1_d[4]) );
  DFFRHQX4 \X9_reg[1]  ( .D(n349), .CK(clk), .RN(n420), .Q(X9[1]) );
  DFFRHQX1 \X8_reg[1]  ( .D(n335), .CK(clk), .RN(n420), .Q(X8[1]) );
  DFFRHQX4 \X9_reg[0]  ( .D(n347), .CK(clk), .RN(n416), .Q(X9[0]) );
  DFFRHQX1 \X8_reg[0]  ( .D(X9[0]), .CK(clk), .RN(n414), .Q(X8[0]) );
  DFFRHQX2 \X1_d_reg[3]  ( .D(X1[3]), .CK(clk), .RN(n417), .Q(X1_d[3]) );
  DFFRHQX2 \X1_d_reg[2]  ( .D(X1[2]), .CK(clk), .RN(n417), .Q(X1_d[2]) );
  DFFRHQX1 \X9_reg[4]  ( .D(n361), .CK(clk), .RN(n419), .Q(X9[4]) );
  DFFRHQX2 \X9_reg[2]  ( .D(n351), .CK(clk), .RN(n420), .Q(X9[2]) );
  DFFRHQX1 \X1_d_reg[1]  ( .D(X1[1]), .CK(clk), .RN(n414), .Q(X1_d[1]) );
  DFFRHQX2 \X1_d_reg[0]  ( .D(X1[0]), .CK(clk), .RN(n1000), .Q(X1_d[0]) );
  DFFRHQXL \X8_reg[4]  ( .D(X9[4]), .CK(clk), .RN(n419), .Q(X8[4]) );
  OAI2BB1X2 U360 ( .A0N(C8_temp[3]), .A1N(n606), .B0(n603), .Y(n605) );
  CLKBUFX8 U361 ( .A(n515), .Y(n373) );
  OR2X4 U362 ( .A(n746), .B(n700), .Y(n702) );
  BUFX16 U363 ( .A(Xt_temp[1]), .Y(n400) );
  BUFX8 U364 ( .A(Xt_temp[8]), .Y(n406) );
  OAI222X1 U365 ( .A0(n511), .A1(n510), .B0(C4_temp[3]), .B1(n509), .C0(n508), 
        .C1(n507), .Y(n514) );
  OAI2BB1X2 U366 ( .A0N(C4_temp[3]), .A1N(n509), .B0(n506), .Y(n508) );
  NAND4X2 U367 ( .A(n663), .B(n687), .C(n662), .D(n661), .Y(n669) );
  OAI2BB1X4 U368 ( .A0N(X1_d[4]), .A1N(n429), .B0(n442), .Y(n436) );
  INVX2 U369 ( .A(X9[4]), .Y(n429) );
  AOI2BB2X4 U370 ( .B0(n806), .B1(n804), .A0N(n732), .A1N(n731), .Y(n733) );
  BUFX3 U371 ( .A(X9[2]), .Y(n303) );
  OR2X4 U372 ( .A(n443), .B(n424), .Y(n428) );
  BUFX12 U373 ( .A(Xt_temp[2]), .Y(n401) );
  BUFX12 U374 ( .A(Xt_temp[3]), .Y(n402) );
  INVX4 U375 ( .A(n724), .Y(n727) );
  MXI2X1 U376 ( .A(n813), .B(n812), .S0(n410), .Y(n853) );
  AOI222X2 U377 ( .A0(n574), .A1(n573), .B0(n572), .B1(n787), .C0(n789), .C1(
        n571), .Y(n593) );
  INVX4 U378 ( .A(n580), .Y(n583) );
  CLKBUFX8 U379 ( .A(Xt_temp[0]), .Y(n399) );
  BUFX12 U380 ( .A(Xt_temp[6]), .Y(n340) );
  CLKBUFX12 U381 ( .A(Xt_temp[7]), .Y(n405) );
  BUFX3 U382 ( .A(n860), .Y(n331) );
  BUFX20 U383 ( .A(n840), .Y(n410) );
  OAI22X1 U384 ( .A0(C3_temp[3]), .A1(n838), .B0(C4_temp[3]), .B1(n578), .Y(
        n553) );
  OAI22X1 U385 ( .A0(C7_temp[5]), .A1(n337), .B0(C8_temp[5]), .B1(n332), .Y(
        n709) );
  INVX1 U386 ( .A(n709), .Y(n772) );
  INVX2 U387 ( .A(n564), .Y(n775) );
  INVX1 U388 ( .A(n711), .Y(n781) );
  NAND2BX2 U389 ( .AN(n614), .B(C8_temp[10]), .Y(n638) );
  OAI2BB1X2 U390 ( .A0N(C6_temp[3]), .A1N(n658), .B0(n655), .Y(n657) );
  NAND3X1 U391 ( .A(C6_temp[7]), .B(n377), .C(n671), .Y(n686) );
  INVX1 U392 ( .A(C5_temp[9]), .Y(n675) );
  OAI22X1 U393 ( .A0(C1_temp[2]), .A1(n835), .B0(C2_temp[2]), .B1(n576), .Y(
        n551) );
  OAI22X1 U394 ( .A0(C5_temp[4]), .A1(n841), .B0(C6_temp[4]), .B1(n721), .Y(
        n711) );
  NAND3X2 U395 ( .A(n781), .B(n713), .C(n712), .Y(n716) );
  MXI2X1 U396 ( .A(n344), .B(n762), .S0(n411), .Y(n890) );
  INVX1 U397 ( .A(n876), .Y(n754) );
  NAND2BX1 U398 ( .AN(n862), .B(n863), .Y(n791) );
  MXI2X1 U399 ( .A(n760), .B(n759), .S0(n410), .Y(n888) );
  BUFX3 U400 ( .A(n890), .Y(n336) );
  MXI2X2 U401 ( .A(n744), .B(n743), .S0(n410), .Y(n876) );
  MXI2X2 U402 ( .A(n746), .B(n745), .S0(n411), .Y(n875) );
  MXI2X2 U403 ( .A(n773), .B(n772), .S0(n411), .Y(n862) );
  MXI2X2 U404 ( .A(n775), .B(n774), .S0(n410), .Y(n863) );
  BUFX12 U405 ( .A(\C5[11] ), .Y(n398) );
  INVX1 U406 ( .A(n505), .Y(n509) );
  NAND2BX2 U407 ( .AN(n516), .B(C4_temp[10]), .Y(n539) );
  OAI2BB1X2 U408 ( .A0N(C2_temp[3]), .A1N(n459), .B0(n456), .Y(n458) );
  INVX1 U409 ( .A(n741), .Y(n740) );
  MXI2X1 U410 ( .A(n789), .B(n788), .S0(n410), .Y(n867) );
  MX2X2 U411 ( .A(n891), .B(n336), .S0(n412), .Y(n379) );
  MXI2X1 U412 ( .A(n819), .B(n818), .S0(n410), .Y(n851) );
  BUFX4 U413 ( .A(n378), .Y(n337) );
  INVX1 U414 ( .A(n881), .Y(n884) );
  INVX1 U415 ( .A(n906), .Y(n907) );
  CLKINVX3 U416 ( .A(n904), .Y(n909) );
  MXI2X1 U417 ( .A(n808), .B(n338), .S0(n410), .Y(n856) );
  CLKINVX3 U418 ( .A(n998), .Y(\Y1[0] ) );
  CLKINVX3 U419 ( .A(n987), .Y(n999) );
  CLKINVX3 U420 ( .A(n977), .Y(n997) );
  MXI2X1 U421 ( .A(X9[7]), .B(n938), .S0(n970), .Y(n976) );
  BUFX3 U422 ( .A(X1_d[1]), .Y(n334) );
  INVX1 U423 ( .A(n972), .Y(\Y1[2] ) );
  INVX1 U424 ( .A(n950), .Y(n995) );
  BUFX12 U425 ( .A(Xt_temp[9]), .Y(n407) );
  AOI22X1 U426 ( .A0(X6[3]), .A1(n381), .B0(n304), .B1(X5[3]), .Y(n941) );
  INVX1 U427 ( .A(n963), .Y(n304) );
  AOI22X1 U428 ( .A0(X4[0]), .A1(n382), .B0(n305), .B1(X3[0]), .Y(n968) );
  INVX1 U429 ( .A(n961), .Y(n305) );
  AOI22X1 U430 ( .A0(X2[0]), .A1(n383), .B0(n306), .B1(X1[0]), .Y(n969) );
  INVX1 U431 ( .A(n960), .Y(n306) );
  AOI22X1 U432 ( .A0(X8[2]), .A1(n384), .B0(n307), .B1(X7[2]), .Y(n945) );
  INVX1 U433 ( .A(n965), .Y(n307) );
  AOI22X1 U434 ( .A0(X4[3]), .A1(n382), .B0(n308), .B1(X3[3]), .Y(n942) );
  INVX1 U435 ( .A(n961), .Y(n308) );
  AOI22X1 U436 ( .A0(X2[3]), .A1(n383), .B0(n309), .B1(X1[3]), .Y(n943) );
  INVX1 U437 ( .A(n960), .Y(n309) );
  NAND2BX1 U438 ( .AN(n913), .B(C9_temp[9]), .Y(n859) );
  AOI22X1 U439 ( .A0(X4[2]), .A1(n382), .B0(n310), .B1(X3[2]), .Y(n947) );
  INVX1 U440 ( .A(n961), .Y(n310) );
  NAND2XL U441 ( .A(n746), .B(n700), .Y(n708) );
  INVX1 U442 ( .A(n699), .Y(n746) );
  AOI22X1 U443 ( .A0(X2[2]), .A1(n383), .B0(n311), .B1(X1[2]), .Y(n948) );
  INVX1 U444 ( .A(n960), .Y(n311) );
  OR2X2 U445 ( .A(n709), .B(n773), .Y(n712) );
  INVX1 U446 ( .A(n710), .Y(n773) );
  AOI22X1 U447 ( .A0(X6[2]), .A1(n381), .B0(n312), .B1(X5[2]), .Y(n946) );
  INVX1 U448 ( .A(n963), .Y(n312) );
  AOI22X1 U449 ( .A0(X4[5]), .A1(n382), .B0(n313), .B1(X3[5]), .Y(n926) );
  INVX1 U450 ( .A(n961), .Y(n313) );
  NAND3X1 U451 ( .A(n750), .B(n748), .C(n702), .Y(n707) );
  AOI22X1 U452 ( .A0(X2[5]), .A1(n383), .B0(n314), .B1(X1[5]), .Y(n927) );
  INVX1 U453 ( .A(n960), .Y(n314) );
  AOI22X1 U454 ( .A0(X8[4]), .A1(n384), .B0(n315), .B1(X7[4]), .Y(n929) );
  INVX1 U455 ( .A(n965), .Y(n315) );
  AOI22X1 U456 ( .A0(X4[7]), .A1(n382), .B0(n316), .B1(X3[7]), .Y(n936) );
  INVX1 U457 ( .A(n961), .Y(n316) );
  AND2X1 U458 ( .A(n730), .B(n814), .Y(n731) );
  AOI22X1 U459 ( .A0(X2[7]), .A1(n383), .B0(n317), .B1(X1[7]), .Y(n937) );
  INVX1 U460 ( .A(n960), .Y(n317) );
  AOI2BB2X2 U461 ( .B0(n759), .B1(n758), .A0N(n763), .A1N(n765), .Y(n558) );
  NAND2BX1 U462 ( .AN(n863), .B(n862), .Y(n792) );
  AOI22X1 U463 ( .A0(X6[4]), .A1(n381), .B0(n318), .B1(X5[4]), .Y(n930) );
  INVX1 U464 ( .A(n963), .Y(n318) );
  OR2X1 U465 ( .A(n987), .B(n973), .Y(n982) );
  AOI22X1 U466 ( .A0(X8[7]), .A1(n384), .B0(n319), .B1(X7[7]), .Y(n934) );
  INVX1 U467 ( .A(n965), .Y(n319) );
  AOI22X1 U468 ( .A0(X4[4]), .A1(n382), .B0(n320), .B1(X3[4]), .Y(n931) );
  INVX1 U469 ( .A(n961), .Y(n320) );
  NAND2X4 U470 ( .A(n741), .B(n378), .Y(n332) );
  AOI22X1 U471 ( .A0(X6[7]), .A1(n381), .B0(n321), .B1(X5[7]), .Y(n935) );
  INVX1 U472 ( .A(n963), .Y(n321) );
  NAND2X1 U473 ( .A(n972), .B(n950), .Y(n991) );
  AOI22X1 U474 ( .A0(X4[6]), .A1(n382), .B0(n322), .B1(X3[6]), .Y(n848) );
  INVX1 U475 ( .A(n961), .Y(n322) );
  OAI22X4 U476 ( .A0(n433), .A1(X9[7]), .B0(n434), .B1(n435), .Y(N28) );
  NAND2X1 U477 ( .A(n687), .B(n686), .Y(n691) );
  AOI2BB2X1 U478 ( .B0(n780), .B1(n711), .A0N(n784), .A1N(n786), .Y(n719) );
  MX2X2 U479 ( .A(n888), .B(n887), .S0(n412), .Y(n892) );
  AOI22X1 U480 ( .A0(X2[6]), .A1(n383), .B0(n323), .B1(X1[6]), .Y(n849) );
  INVX1 U481 ( .A(n960), .Y(n323) );
  NAND2X1 U482 ( .A(n715), .B(n716), .Y(n717) );
  AOI21X1 U483 ( .A0(n892), .A1(C9_temp[0]), .B0(n379), .Y(n893) );
  AOI22X1 U484 ( .A0(X2[4]), .A1(n383), .B0(n324), .B1(X1[4]), .Y(n932) );
  INVX1 U485 ( .A(n960), .Y(n324) );
  AOI21X1 U486 ( .A0(n432), .A1(X1_d[6]), .B0(n440), .Y(n431) );
  NAND2X1 U487 ( .A(n688), .B(n686), .Y(n668) );
  AND2X2 U488 ( .A(n392), .B(n483), .Y(n482) );
  OR2X4 U489 ( .A(n725), .B(n800), .Y(n724) );
  CLKINVX3 U490 ( .A(n726), .Y(n800) );
  AOI2BB2X2 U491 ( .B0(n766), .B1(n888), .A0N(n890), .A1N(n767), .Y(n770) );
  INVX1 U492 ( .A(n887), .Y(n766) );
  AOI22X1 U493 ( .A0(X8[5]), .A1(n384), .B0(n325), .B1(X7[5]), .Y(n924) );
  INVX1 U494 ( .A(n965), .Y(n325) );
  NAND2BX4 U495 ( .AN(X9[0]), .B(X1_d[0]), .Y(n449) );
  OR2X2 U496 ( .A(n978), .B(n981), .Y(n974) );
  OR2X2 U497 ( .A(n362), .B(n363), .Y(n761) );
  NAND2X1 U498 ( .A(n638), .B(n342), .Y(n625) );
  AND2X2 U499 ( .A(n763), .B(n765), .Y(n557) );
  INVX1 U500 ( .A(n555), .Y(n765) );
  NAND3BX1 U501 ( .AN(n861), .B(n860), .C(n791), .Y(n793) );
  NAND2X1 U502 ( .A(n539), .B(n538), .Y(n543) );
  NAND2X1 U503 ( .A(n491), .B(n489), .Y(n469) );
  NOR2X1 U504 ( .A(n829), .B(n857), .Y(n380) );
  INVX1 U505 ( .A(n856), .Y(n829) );
  AOI22X1 U506 ( .A0(X6[5]), .A1(n381), .B0(n326), .B1(X5[5]), .Y(n925) );
  INVX1 U507 ( .A(n963), .Y(n326) );
  AND2X2 U508 ( .A(n977), .B(n976), .Y(n978) );
  XOR2X1 U509 ( .A(X9[0]), .B(X1_d[0]), .Y(N17) );
  NAND2BX1 U510 ( .AN(n710), .B(n709), .Y(n715) );
  NAND2X1 U511 ( .A(n687), .B(n333), .Y(n676) );
  NAND2X1 U512 ( .A(n792), .B(n793), .Y(n795) );
  NAND2XL U513 ( .A(n540), .B(n538), .Y(n519) );
  NAND3X1 U514 ( .A(n330), .B(n491), .C(n484), .Y(n495) );
  CLKINVX3 U515 ( .A(n329), .Y(n330) );
  INVX1 U516 ( .A(n568), .Y(n789) );
  AOI22X1 U517 ( .A0(X8[6]), .A1(n384), .B0(n327), .B1(X7[6]), .Y(n846) );
  INVX1 U518 ( .A(n965), .Y(n327) );
  OR2X2 U519 ( .A(n447), .B(n424), .Y(n425) );
  AND2X2 U520 ( .A(n394), .B(n986), .Y(\Y1[11] ) );
  INVX1 U521 ( .A(n976), .Y(n986) );
  OR2X2 U522 ( .A(n634), .B(n633), .Y(n642) );
  NAND2X1 U523 ( .A(n539), .B(n537), .Y(n527) );
  NAND2X1 U524 ( .A(n490), .B(n489), .Y(n494) );
  NAND3X1 U525 ( .A(n793), .B(n792), .C(n867), .Y(n796) );
  AOI22X1 U526 ( .A0(X6[6]), .A1(n381), .B0(n328), .B1(X5[6]), .Y(n847) );
  INVX1 U527 ( .A(n963), .Y(n328) );
  NOR2BX2 U528 ( .AN(X1_d[2]), .B(n303), .Y(n447) );
  NOR2BX1 U529 ( .AN(X1_d[5]), .B(X9[5]), .Y(n440) );
  NOR2BX2 U530 ( .AN(n739), .B(n843), .Y(n388) );
  BUFX8 U531 ( .A(n664), .Y(n377) );
  OAI221X2 U532 ( .A0(n753), .A1(n751), .B0(n558), .B1(n557), .C0(n556), .Y(
        n560) );
  NOR2BX4 U533 ( .AN(n595), .B(n836), .Y(n387) );
  OAI2BB1X4 U534 ( .A0N(n740), .A1N(n739), .B0(n738), .Y(n842) );
  CLKINVX3 U535 ( .A(n488), .Y(n329) );
  NAND3XL U536 ( .A(C2_temp[9]), .B(n465), .C(n476), .Y(n488) );
  OAI2BB1X4 U537 ( .A0N(n973), .A1N(n987), .B0(n991), .Y(n981) );
  AOI31X2 U538 ( .A0(n779), .A1(n778), .A2(n777), .B0(n776), .Y(n798) );
  OR2X2 U539 ( .A(n876), .B(n747), .Y(n779) );
  AOI2BB2X4 U540 ( .B0(n600), .B1(n599), .A0N(C8_temp[1]), .A1N(n598), .Y(n608) );
  NOR2BX2 U541 ( .AN(C8_temp[6]), .B(n635), .Y(n644) );
  OAI22X4 U542 ( .A0(C5_temp[8]), .A1(n841), .B0(C6_temp[8]), .B1(n721), .Y(
        n726) );
  MXI2X1 U543 ( .A(n863), .B(n862), .S0(n412), .Y(n864) );
  CLKINVX3 U544 ( .A(n867), .Y(n794) );
  INVX4 U545 ( .A(n728), .Y(n730) );
  OAI22X4 U546 ( .A0(C5_temp[5]), .A1(n841), .B0(C6_temp[5]), .B1(n721), .Y(
        n710) );
  OAI32X4 U547 ( .A0(C5_temp[2]), .A1(n398), .A2(n655), .B0(n654), .B1(n653), 
        .Y(n659) );
  OR2X4 U548 ( .A(C5_temp[3]), .B(n398), .Y(n654) );
  OAI32X2 U549 ( .A0(n669), .A1(n668), .A2(n667), .B0(C6_temp[10]), .B1(n666), 
        .Y(n696) );
  NAND2BX4 U550 ( .AN(n906), .B(C9_temp[8]), .Y(n904) );
  MXI2X2 U551 ( .A(n876), .B(n875), .S0(n412), .Y(n879) );
  OAI2BB2X2 U552 ( .B0(X1_d[6]), .B1(n432), .A0N(n431), .A1N(n430), .Y(n435)
         );
  OAI22XL U553 ( .A0(C1_temp[10]), .A1(n835), .B0(C2_temp[10]), .B1(n576), .Y(
        n577) );
  NAND4X2 U554 ( .A(n514), .B(n539), .C(n513), .D(n512), .Y(n520) );
  OAI22X2 U555 ( .A0(n392), .A1(n483), .B0(C2_temp[5]), .B1(n482), .Y(n486) );
  OAI22X2 U556 ( .A0(C1_temp[4]), .A1(n835), .B0(C2_temp[4]), .B1(n576), .Y(
        n565) );
  INVX20 U557 ( .A(n387), .Y(n576) );
  CLKINVX3 U558 ( .A(n874), .Y(n771) );
  OAI32X1 U559 ( .A0(n545), .A1(n544), .A2(n543), .B0(n542), .B1(n541), .Y(
        n546) );
  INVX4 U560 ( .A(n837), .Y(n840) );
  AND2X2 U561 ( .A(X9[7]), .B(n433), .Y(n434) );
  XOR2X2 U562 ( .A(n993), .B(n979), .Y(\Y1[9] ) );
  NAND2X2 U563 ( .A(n366), .B(n367), .Y(n582) );
  OAI22X1 U564 ( .A0(C1_temp[3]), .A1(n835), .B0(C2_temp[3]), .B1(n576), .Y(
        n552) );
  OR2X2 U565 ( .A(n775), .B(n563), .Y(n566) );
  OR2X2 U566 ( .A(n619), .B(n621), .Y(n639) );
  BUFX3 U567 ( .A(n390), .Y(n375) );
  CLKINVX3 U568 ( .A(n891), .Y(n767) );
  OR2X2 U569 ( .A(n754), .B(n875), .Y(n768) );
  MXI2X2 U570 ( .A(n757), .B(n756), .S0(n411), .Y(n887) );
  MXI2X1 U571 ( .A(n753), .B(n752), .S0(n410), .Y(n874) );
  BUFX3 U572 ( .A(n873), .Y(n374) );
  INVX1 U573 ( .A(n565), .Y(n783) );
  OAI32X1 U574 ( .A0(C1_temp[2]), .A1(\C1[11] ), .A2(n456), .B0(n455), .B1(
        n454), .Y(n460) );
  INVX2 U575 ( .A(\C1[11] ), .Y(n465) );
  OR2X2 U576 ( .A(n774), .B(n564), .Y(n569) );
  INVX1 U577 ( .A(n567), .Y(n782) );
  INVX1 U578 ( .A(\C8[11] ), .Y(n648) );
  NAND3X1 U579 ( .A(n374), .B(n771), .C(n768), .Y(n778) );
  INVX1 U580 ( .A(n875), .Y(n747) );
  INVX1 U581 ( .A(n331), .Y(n790) );
  MXI2X1 U582 ( .A(n781), .B(n780), .S0(n411), .Y(n860) );
  MXI2X2 U583 ( .A(n810), .B(n341), .S0(n411), .Y(n852) );
  INVX1 U584 ( .A(n575), .Y(n812) );
  OAI22X1 U585 ( .A0(C3_temp[7]), .A1(n838), .B0(C4_temp[7]), .B1(n578), .Y(
        n575) );
  CLKINVX3 U586 ( .A(n844), .Y(n378) );
  NAND2BX1 U587 ( .AN(C9_temp[5]), .B(n864), .Y(n871) );
  NAND2BX2 U588 ( .AN(n864), .B(C9_temp[5]), .Y(n882) );
  OAI2BB1X1 U589 ( .A0N(n913), .A1N(n912), .B0(C9_temp[9]), .Y(n914) );
  AOI2BB1X2 U590 ( .A0N(n913), .A1N(n912), .B0(n911), .Y(n915) );
  INVX1 U591 ( .A(n335), .Y(n423) );
  OR2X2 U592 ( .A(n334), .B(n423), .Y(n443) );
  NAND2BX1 U593 ( .AN(X9[3]), .B(X1_d[3]), .Y(n422) );
  OR2X2 U594 ( .A(n950), .B(n972), .Y(n990) );
  MXI2X1 U595 ( .A(X9[6]), .B(n923), .S0(n970), .Y(n973) );
  CLKBUFX8 U596 ( .A(X9[1]), .Y(n335) );
  BUFX8 U597 ( .A(Xt_temp[5]), .Y(n404) );
  CLKBUFX8 U598 ( .A(Xt_temp[11]), .Y(n409) );
  NAND3X2 U599 ( .A(C6_temp[9]), .B(n377), .C(n675), .Y(n333) );
  OAI22X1 U600 ( .A0(C7_temp[4]), .A1(n337), .B0(C8_temp[4]), .B1(n332), .Y(
        n713) );
  INVX1 U601 ( .A(n807), .Y(n338) );
  OAI22X1 U602 ( .A0(C3_temp[10]), .A1(n838), .B0(C4_temp[10]), .B1(n578), .Y(
        n807) );
  OAI22X1 U603 ( .A0(C5_temp[0]), .A1(n841), .B0(C6_temp[0]), .B1(n721), .Y(
        n755) );
  NAND3X1 U604 ( .A(C4_temp[9]), .B(n373), .C(n526), .Y(n537) );
  OAI22X1 U605 ( .A0(C5_temp[6]), .A1(n841), .B0(C6_temp[6]), .B1(n721), .Y(
        n714) );
  OAI2BB1X2 U606 ( .A0N(n977), .A1N(n996), .B0(n396), .Y(n988) );
  OR2X2 U607 ( .A(n977), .B(n996), .Y(n989) );
  OAI32X1 U608 ( .A0(n693), .A1(n692), .A2(n691), .B0(n690), .B1(n689), .Y(
        n694) );
  OAI32X2 U609 ( .A0(n644), .A1(n643), .A2(n642), .B0(n641), .B1(n640), .Y(
        n645) );
  NAND3X1 U610 ( .A(n342), .B(n636), .C(n635), .Y(n641) );
  INVX4 U611 ( .A(n852), .Y(n823) );
  OAI22X4 U612 ( .A0(C1_temp[1]), .A1(n835), .B0(C2_temp[1]), .B1(n576), .Y(
        n555) );
  OAI22X1 U613 ( .A0(C1_temp[9]), .A1(n835), .B0(C2_temp[9]), .B1(n576), .Y(
        n817) );
  INVX12 U614 ( .A(n836), .Y(n835) );
  INVX4 U615 ( .A(n584), .Y(n586) );
  OAI32X2 U616 ( .A0(n618), .A1(n617), .A2(n616), .B0(C8_temp[10]), .B1(n615), 
        .Y(n647) );
  AOI31X2 U617 ( .A0(n562), .A1(n561), .A2(n560), .B0(n559), .Y(n574) );
  NOR2XL U618 ( .A(n857), .B(n856), .Y(n385) );
  MXI2X4 U619 ( .A(n765), .B(n764), .S0(n410), .Y(n891) );
  OR2X4 U620 ( .A(n550), .B(n836), .Y(n595) );
  OAI22X4 U621 ( .A0(C1_temp[5]), .A1(n835), .B0(C2_temp[5]), .B1(n576), .Y(
        n564) );
  BUFX12 U622 ( .A(n919), .Y(n339) );
  INVX4 U623 ( .A(n996), .Y(\Y1[1] ) );
  BUFX12 U624 ( .A(Xt_temp[4]), .Y(n403) );
  OR2X2 U625 ( .A(C1_temp[8]), .B(n835), .Y(n366) );
  INVX1 U626 ( .A(n398), .Y(n664) );
  INVX1 U627 ( .A(\C3[11] ), .Y(n515) );
  OAI22X2 U628 ( .A0(C3_temp[8]), .A1(n838), .B0(C4_temp[8]), .B1(n578), .Y(
        n581) );
  OAI22X2 U629 ( .A0(C3_temp[1]), .A1(n838), .B0(C4_temp[1]), .B1(n578), .Y(
        n763) );
  OAI22X1 U630 ( .A0(C3_temp[0]), .A1(n838), .B0(C4_temp[0]), .B1(n578), .Y(
        n554) );
  INVX1 U631 ( .A(C3_temp[7]), .Y(n522) );
  INVX1 U632 ( .A(C1_temp[7]), .Y(n472) );
  INVX1 U633 ( .A(n563), .Y(n774) );
  INVX1 U634 ( .A(n763), .Y(n764) );
  INVX1 U635 ( .A(n602), .Y(n606) );
  BUFX3 U636 ( .A(n613), .Y(n376) );
  OR2X2 U637 ( .A(n670), .B(n672), .Y(n688) );
  OAI22X1 U638 ( .A0(n393), .A1(n682), .B0(C6_temp[5]), .B1(n681), .Y(n684) );
  AND2X2 U639 ( .A(n393), .B(n682), .Y(n681) );
  INVX1 U640 ( .A(n722), .Y(n806) );
  OR2X2 U641 ( .A(n521), .B(n523), .Y(n540) );
  OAI22X1 U642 ( .A0(n391), .A1(n533), .B0(C4_temp[5]), .B1(n532), .Y(n535) );
  AND2X2 U643 ( .A(n391), .B(n533), .Y(n532) );
  NAND3X1 U644 ( .A(C2_temp[7]), .B(n465), .C(n472), .Y(n489) );
  INVX1 U645 ( .A(n455), .Y(n459) );
  OR2X2 U646 ( .A(n471), .B(n473), .Y(n491) );
  NAND3X1 U647 ( .A(n783), .B(n567), .C(n566), .Y(n570) );
  OR2X2 U648 ( .A(n743), .B(n552), .Y(n562) );
  OAI22X1 U649 ( .A0(C1_temp[7]), .A1(n835), .B0(C2_temp[7]), .B1(n576), .Y(
        n811) );
  OAI22X1 U650 ( .A0(C5_temp[7]), .A1(n841), .B0(C6_temp[7]), .B1(n721), .Y(
        n809) );
  INVX1 U651 ( .A(n854), .Y(n822) );
  OR2X2 U652 ( .A(n685), .B(n683), .Y(n662) );
  INVX1 U653 ( .A(\C6[11] ), .Y(n697) );
  NAND2BX2 U654 ( .AN(C9_temp[3]), .B(n879), .Y(n880) );
  AOI2BB2X1 U655 ( .B0(C9_temp[2]), .B1(n878), .A0N(n879), .A1N(n877), .Y(n899) );
  INVX1 U656 ( .A(n871), .Y(n865) );
  INVX1 U657 ( .A(n905), .Y(n908) );
  OAI2BB1X1 U658 ( .A0N(C4_temp[5]), .A1N(n391), .B0(n537), .Y(n518) );
  NOR2BX1 U659 ( .AN(C4_temp[6]), .B(n535), .Y(n545) );
  INVX1 U660 ( .A(\C4[11] ), .Y(n549) );
  OAI2BB1X1 U661 ( .A0N(C2_temp[5]), .A1N(n392), .B0(n330), .Y(n468) );
  INVX1 U662 ( .A(\C2[11] ), .Y(n550) );
  CLKINVX3 U663 ( .A(n742), .Y(n596) );
  OR2X2 U664 ( .A(n808), .B(n807), .Y(n579) );
  OAI2BB1X1 U665 ( .A0N(n812), .A1N(n811), .B0(n579), .Y(n591) );
  INVX1 U666 ( .A(n851), .Y(n820) );
  INVX1 U667 ( .A(n853), .Y(n821) );
  CLKINVX3 U668 ( .A(n843), .Y(n841) );
  INVX1 U669 ( .A(n910), .Y(n911) );
  NAND2BX1 U670 ( .AN(n905), .B(C9_temp[7]), .Y(n858) );
  MXI2X2 U671 ( .A(n335), .B(n959), .S0(n970), .Y(n996) );
  INVX1 U672 ( .A(n422), .Y(n424) );
  OAI2BB1X2 U673 ( .A0N(n334), .A1N(n423), .B0(n449), .Y(n444) );
  AND2X2 U674 ( .A(n436), .B(n437), .Y(n395) );
  INVX1 U675 ( .A(X1_d[7]), .Y(n433) );
  XOR2X1 U676 ( .A(\Y1[0] ), .B(n999), .Y(\Y1[3] ) );
  INVX1 U677 ( .A(n983), .Y(n975) );
  INVX1 U678 ( .A(n973), .Y(n993) );
  XOR3X2 U679 ( .A(X1_d[6]), .B(X9[6]), .C(n441), .Y(N23) );
  AOI2BB1X2 U680 ( .A0N(n395), .A1N(n440), .B0(n439), .Y(n441) );
  INVX1 U681 ( .A(n438), .Y(n439) );
  MXI2X1 U682 ( .A(n786), .B(n785), .S0(n411), .Y(n866) );
  AND2X2 U683 ( .A(n368), .B(n369), .Y(n341) );
  NAND2X2 U684 ( .A(n376), .B(n345), .Y(n342) );
  MXI2X1 U685 ( .A(n806), .B(n805), .S0(n411), .Y(n857) );
  INVX1 U686 ( .A(n581), .Y(n801) );
  XOR2X4 U687 ( .A(n449), .B(n335), .Y(n343) );
  AND2X2 U688 ( .A(n370), .B(n371), .Y(n344) );
  AND2X2 U689 ( .A(n624), .B(C8_temp[9]), .Y(n345) );
  INVXL U690 ( .A(N30), .Y(n346) );
  INVXL U691 ( .A(n346), .Y(n347) );
  INVXL U692 ( .A(N31), .Y(n348) );
  INVXL U693 ( .A(n348), .Y(n349) );
  INVXL U694 ( .A(N32), .Y(n350) );
  INVXL U695 ( .A(n350), .Y(n351) );
  INVXL U696 ( .A(X[5]), .Y(n352) );
  INVXL U697 ( .A(n352), .Y(n353) );
  INVXL U698 ( .A(X[6]), .Y(n354) );
  INVXL U699 ( .A(n354), .Y(n355) );
  INVXL U700 ( .A(X[7]), .Y(n356) );
  INVXL U701 ( .A(n356), .Y(n357) );
  INVXL U702 ( .A(X[3]), .Y(n358) );
  INVXL U703 ( .A(n358), .Y(n359) );
  INVXL U704 ( .A(X[4]), .Y(n360) );
  INVXL U705 ( .A(n360), .Y(n361) );
  NOR2X1 U706 ( .A(C7_temp[1]), .B(n337), .Y(n362) );
  NOR2X1 U707 ( .A(C8_temp[1]), .B(n332), .Y(n363) );
  OR2X2 U708 ( .A(C7_temp[8]), .B(n337), .Y(n364) );
  OR2X4 U709 ( .A(C8_temp[8]), .B(n332), .Y(n365) );
  NAND2X4 U710 ( .A(n364), .B(n365), .Y(n725) );
  OR2X4 U711 ( .A(C2_temp[8]), .B(n576), .Y(n367) );
  CLKINVX3 U712 ( .A(n582), .Y(n802) );
  INVX1 U713 ( .A(C7_temp[9]), .Y(n624) );
  OR2X1 U714 ( .A(C7_temp[7]), .B(n337), .Y(n368) );
  OR2X2 U715 ( .A(C8_temp[7]), .B(n332), .Y(n369) );
  OR2X2 U716 ( .A(C5_temp[1]), .B(n841), .Y(n370) );
  OR2X2 U717 ( .A(C6_temp[1]), .B(n721), .Y(n371) );
  OAI2BB1X4 U718 ( .A0N(n596), .A1N(n595), .B0(n594), .Y(n837) );
  NAND3X1 U719 ( .A(n330), .B(n487), .C(n486), .Y(n493) );
  NAND3X1 U720 ( .A(n333), .B(n685), .C(n684), .Y(n690) );
  BUFX3 U721 ( .A(X9[5]), .Y(n372) );
  OAI22X1 U722 ( .A0(C3_temp[6]), .A1(n838), .B0(C4_temp[6]), .B1(n578), .Y(
        n787) );
  INVX12 U723 ( .A(n839), .Y(n838) );
  MXI2X2 U724 ( .A(n783), .B(n782), .S0(n410), .Y(n861) );
  OAI22X1 U725 ( .A0(C1_temp[0]), .A1(n835), .B0(C2_temp[0]), .B1(n576), .Y(
        n758) );
  AOI2BB2X4 U726 ( .B0(n652), .B1(n651), .A0N(C6_temp[1]), .A1N(n650), .Y(n660) );
  OR2X2 U727 ( .A(n549), .B(n839), .Y(n742) );
  XOR2X4 U728 ( .A(n986), .B(n394), .Y(\Y1[10] ) );
  XNOR3X2 U729 ( .A(X1_d[4]), .B(X9[4]), .C(n442), .Y(N21) );
  INVX4 U730 ( .A(n552), .Y(n744) );
  OAI222X2 U731 ( .A0(n461), .A1(n460), .B0(C2_temp[3]), .B1(n459), .C0(n458), 
        .C1(n457), .Y(n464) );
  AOI2BB2X2 U732 ( .B0(n453), .B1(n452), .A0N(C2_temp[1]), .A1N(n451), .Y(n461) );
  MXI2X1 U733 ( .A(n853), .B(n852), .S0(n412), .Y(n905) );
  MXI2X1 U734 ( .A(n855), .B(n854), .S0(n412), .Y(n906) );
  OAI22X1 U735 ( .A0(C1_temp[6]), .A1(n835), .B0(C2_temp[6]), .B1(n576), .Y(
        n568) );
  OAI22X1 U736 ( .A0(C3_temp[4]), .A1(n838), .B0(C4_temp[4]), .B1(n578), .Y(
        n567) );
  OR2X4 U737 ( .A(n648), .B(n844), .Y(n741) );
  AOI31X2 U738 ( .A0(n708), .A1(n707), .A2(n706), .B0(n705), .Y(n720) );
  OAI221X2 U739 ( .A0(n750), .A1(n748), .B0(n704), .B1(n703), .C0(n702), .Y(
        n706) );
  INVX16 U740 ( .A(n388), .Y(n721) );
  OAI22X2 U741 ( .A0(C3_temp[5]), .A1(n838), .B0(C4_temp[5]), .B1(n578), .Y(
        n563) );
  NOR2X2 U742 ( .A(C3_temp[5]), .B(\C3[11] ), .Y(n391) );
  INVX1 U743 ( .A(n725), .Y(n799) );
  MXI2X4 U744 ( .A(n303), .B(n949), .S0(n970), .Y(n972) );
  NOR2X4 U745 ( .A(n987), .B(n998), .Y(n396) );
  MXI2X2 U746 ( .A(X9[0]), .B(n971), .S0(n970), .Y(n998) );
  MXI2X4 U747 ( .A(X9[3]), .B(n944), .S0(n970), .Y(n987) );
  MXI2X4 U748 ( .A(X9[4]), .B(n933), .S0(n970), .Y(n977) );
  OAI2BB1X2 U749 ( .A0N(n991), .A1N(n994), .B0(n990), .Y(n992) );
  AND2X4 U750 ( .A(n767), .B(n336), .Y(n769) );
  OAI22X2 U751 ( .A0(\C9[11] ), .A1(n921), .B0(n920), .B1(n339), .Y(n922) );
  INVX8 U752 ( .A(n339), .Y(n889) );
  AOI2BB2X4 U753 ( .B0(n503), .B1(n502), .A0N(C4_temp[1]), .A1N(n501), .Y(n511) );
  OAI32X2 U754 ( .A0(n824), .A1(n823), .A2(n853), .B0(n822), .B1(n855), .Y(
        n825) );
  NAND4X2 U755 ( .A(n611), .B(n638), .C(n610), .D(n609), .Y(n618) );
  MXI2X4 U756 ( .A(n802), .B(n801), .S0(n410), .Y(n855) );
  MXI2X4 U757 ( .A(n372), .B(n928), .S0(n970), .Y(n950) );
  INVX20 U758 ( .A(n922), .Y(n970) );
  AOI222X2 U759 ( .A0(n720), .A1(n719), .B0(n718), .B1(n784), .C0(n786), .C1(
        n717), .Y(n737) );
  NOR2XL U760 ( .A(C7_temp[5]), .B(\C7[11] ), .Y(n390) );
  INVXL U761 ( .A(\C7[11] ), .Y(n613) );
  OAI22X2 U762 ( .A0(n375), .A1(n631), .B0(C8_temp[5]), .B1(n630), .Y(n635) );
  AND2X4 U763 ( .A(n375), .B(n631), .Y(n630) );
  OAI32X2 U764 ( .A0(n593), .A1(n592), .A2(n591), .B0(n590), .B1(n589), .Y(
        n594) );
  MXI2X4 U765 ( .A(n800), .B(n799), .S0(n411), .Y(n854) );
  OAI32X2 U766 ( .A0(n737), .A1(n736), .A2(n735), .B0(n734), .B1(n733), .Y(
        n738) );
  OAI222X2 U767 ( .A0(n608), .A1(n607), .B0(C8_temp[3]), .B1(n606), .C0(n605), 
        .C1(n604), .Y(n611) );
  NOR2X4 U768 ( .A(C5_temp[5]), .B(n398), .Y(n393) );
  NOR2X2 U769 ( .A(C1_temp[5]), .B(\C1[11] ), .Y(n392) );
  OAI2BB1XL U770 ( .A0N(C6_temp[5]), .A1N(n393), .B0(n333), .Y(n667) );
  OAI32X2 U771 ( .A0(n812), .A1(n583), .A2(n811), .B0(n801), .B1(n582), .Y(
        n584) );
  OAI22X2 U772 ( .A0(C5_temp[3]), .A1(n841), .B0(C6_temp[3]), .B1(n721), .Y(
        n699) );
  NAND2BX4 U773 ( .AN(n854), .B(n855), .Y(n803) );
  AOI2BB2X1 U774 ( .B0(n790), .B1(n861), .A0N(n866), .A1N(n794), .Y(n797) );
  OAI22X1 U775 ( .A0(C3_temp[2]), .A1(n838), .B0(C4_temp[2]), .B1(n578), .Y(
        n751) );
  OAI221X2 U776 ( .A0(n771), .A1(n374), .B0(n770), .B1(n769), .C0(n768), .Y(
        n777) );
  MXI2X1 U777 ( .A(n750), .B(n749), .S0(n411), .Y(n873) );
  OAI22X1 U778 ( .A0(C7_temp[2]), .A1(n337), .B0(C8_temp[2]), .B1(n332), .Y(
        n748) );
  OAI22X1 U779 ( .A0(C7_temp[3]), .A1(n337), .B0(C8_temp[3]), .B1(n332), .Y(
        n700) );
  MXI2X1 U780 ( .A(n867), .B(n866), .S0(n412), .Y(n868) );
  OR2XL U781 ( .A(n623), .B(n622), .Y(n628) );
  OAI2BB1X1 U782 ( .A0N(n623), .A1N(n622), .B0(n621), .Y(n627) );
  AND2X4 U783 ( .A(n995), .B(n980), .Y(n979) );
  XOR2X1 U784 ( .A(n980), .B(n995), .Y(\Y1[8] ) );
  XNOR2X4 U785 ( .A(n334), .B(n343), .Y(N18) );
  OR2XL U786 ( .A(n674), .B(n673), .Y(n679) );
  OAI2BB1XL U787 ( .A0N(n475), .A1N(n474), .B0(n473), .Y(n479) );
  OR2XL U788 ( .A(n525), .B(n524), .Y(n530) );
  OR2XL U789 ( .A(n475), .B(n474), .Y(n480) );
  OAI2BB1XL U790 ( .A0N(n525), .A1N(n524), .B0(n523), .Y(n529) );
  OAI2BB1X1 U791 ( .A0N(n674), .A1N(n673), .B0(n672), .Y(n678) );
  AOI2BB2X4 U792 ( .B0(n829), .B1(n857), .A0N(n828), .A1N(n827), .Y(n830) );
  OAI22XL U793 ( .A0(n852), .A1(n821), .B0(n850), .B1(n820), .Y(n831) );
  CLKINVX3 U794 ( .A(n637), .Y(n633) );
  NAND2X1 U795 ( .A(n988), .B(n989), .Y(n994) );
  AND3X4 U796 ( .A(n993), .B(n995), .C(n980), .Y(n394) );
  AND2X4 U797 ( .A(n443), .B(n444), .Y(n397) );
  BUFX20 U798 ( .A(n845), .Y(n411) );
  CLKINVX8 U799 ( .A(n842), .Y(n845) );
  BUFX20 U800 ( .A(n889), .Y(n412) );
  NAND3X1 U801 ( .A(n333), .B(n688), .C(n683), .Y(n692) );
  AOI2BB2X4 U802 ( .B0(n808), .B1(n807), .A0N(n588), .A1N(n587), .Y(n589) );
  INVXL U803 ( .A(n614), .Y(n615) );
  INVXL U804 ( .A(n516), .Y(n517) );
  INVXL U805 ( .A(n665), .Y(n666) );
  NAND4X2 U806 ( .A(n464), .B(n490), .C(n463), .D(n462), .Y(n470) );
  OAI32X2 U807 ( .A0(n520), .A1(n519), .A2(n518), .B0(C4_temp[10]), .B1(n517), 
        .Y(n548) );
  NOR2BX1 U808 ( .AN(C2_temp[6]), .B(n486), .Y(n496) );
  NAND3X2 U809 ( .A(n990), .B(n989), .C(n988), .Y(n983) );
  OAI2BB1X1 U810 ( .A0N(n984), .A1N(n983), .B0(n982), .Y(n985) );
  INVX1 U811 ( .A(C3_temp[0]), .Y(n500) );
  AOI2BB2X1 U812 ( .B0(X2[1]), .B1(n383), .A0N(n960), .A1N(n951), .Y(n958) );
  AOI2BB2X1 U813 ( .B0(X4[1]), .B1(n382), .A0N(n961), .A1N(n952), .Y(n957) );
  XOR3X2 U814 ( .A(X9[3]), .B(X1_d[3]), .C(n448), .Y(N20) );
  AOI2BB2X1 U815 ( .B0(X6[1]), .B1(n381), .A0N(n963), .A1N(n953), .Y(n956) );
  AOI2BB2X1 U816 ( .B0(X8[1]), .B1(n384), .A0N(n965), .A1N(n954), .Y(n955) );
  AOI222X2 U817 ( .A0(n798), .A1(n797), .B0(n866), .B1(n796), .C0(n795), .C1(
        n794), .Y(n833) );
  MXI2XL U818 ( .A(n874), .B(n374), .S0(n412), .Y(n886) );
  INVXL U819 ( .A(n791), .Y(n776) );
  INVX4 U820 ( .A(n825), .Y(n826) );
  NAND2XL U821 ( .A(n569), .B(n570), .Y(n571) );
  INVXL U822 ( .A(n566), .Y(n559) );
  MXI2XL U823 ( .A(n851), .B(n850), .S0(n412), .Y(n913) );
  AND3X1 U824 ( .A(n410), .B(n838), .C(n339), .Y(n382) );
  AND3X1 U825 ( .A(n412), .B(n841), .C(n842), .Y(n381) );
  AND3X1 U826 ( .A(n411), .B(n337), .C(n412), .Y(n384) );
  AND3X1 U827 ( .A(n835), .B(n837), .C(n339), .Y(n383) );
  INVXL U828 ( .A(n811), .Y(n813) );
  INVXL U829 ( .A(n809), .Y(n810) );
  NOR2XL U830 ( .A(n742), .B(n837), .Y(n386) );
  AOI2BB1X2 U831 ( .A0N(n586), .A1N(n817), .B0(n585), .Y(n588) );
  NAND2BXL U832 ( .AN(n485), .B(n330), .Y(n477) );
  NAND3XL U833 ( .A(n688), .B(n687), .C(n686), .Y(n689) );
  NAND3XL U834 ( .A(n491), .B(n490), .C(n489), .Y(n492) );
  INVX8 U835 ( .A(n389), .Y(n578) );
  OAI32X2 U836 ( .A0(n341), .A1(n727), .A2(n809), .B0(n799), .B1(n726), .Y(
        n728) );
  OR2X4 U837 ( .A(n744), .B(n553), .Y(n556) );
  OR2X4 U838 ( .A(n802), .B(n581), .Y(n580) );
  MXI2XL U839 ( .A(n816), .B(n815), .S0(n411), .Y(n850) );
  INVXL U840 ( .A(n670), .Y(n674) );
  NAND3XL U841 ( .A(n540), .B(n539), .C(n538), .Y(n541) );
  NAND3XL U842 ( .A(n639), .B(n638), .C(n637), .Y(n640) );
  OAI32X4 U843 ( .A0(n548), .A1(n547), .A2(n546), .B0(\C3[11] ), .B1(n549), 
        .Y(n839) );
  OAI32X4 U844 ( .A0(n696), .A1(n695), .A2(n694), .B0(n398), .B1(n697), .Y(
        n843) );
  OAI32X4 U845 ( .A0(n647), .A1(n646), .A2(n645), .B0(\C7[11] ), .B1(n648), 
        .Y(n844) );
  AOI2BB2X2 U846 ( .B0(n756), .B1(n755), .A0N(n344), .A1N(n761), .Y(n704) );
  OAI32XL U847 ( .A0(C3_temp[2]), .A1(\C3[11] ), .A2(n506), .B0(n505), .B1(
        n504), .Y(n510) );
  NAND2BX4 U848 ( .AN(n466), .B(C2_temp[10]), .Y(n490) );
  NAND2BX4 U849 ( .AN(n665), .B(C6_temp[10]), .Y(n687) );
  OAI222X2 U850 ( .A0(n660), .A1(n659), .B0(C6_temp[3]), .B1(n658), .C0(n657), 
        .C1(n656), .Y(n663) );
  OR2X4 U851 ( .A(n697), .B(n843), .Y(n739) );
  OAI32X2 U852 ( .A0(n496), .A1(n495), .A2(n494), .B0(n493), .B1(n492), .Y(
        n497) );
  OAI32X2 U853 ( .A0(n470), .A1(n469), .A2(n468), .B0(C2_temp[10]), .B1(n467), 
        .Y(n499) );
  OAI22XL U854 ( .A0(C5_temp[9]), .A1(n841), .B0(C6_temp[9]), .B1(n721), .Y(
        n814) );
  OAI22XL U855 ( .A0(C7_temp[10]), .A1(n337), .B0(C8_temp[10]), .B1(n332), .Y(
        n804) );
  OAI22XL U856 ( .A0(C7_temp[6]), .A1(n337), .B0(C8_temp[6]), .B1(n332), .Y(
        n784) );
  OAI22XL U857 ( .A0(C7_temp[9]), .A1(n337), .B0(C8_temp[9]), .B1(n332), .Y(
        n729) );
  OAI22XL U858 ( .A0(C3_temp[9]), .A1(n838), .B0(C4_temp[9]), .B1(n578), .Y(
        n585) );
  OAI32XL U859 ( .A0(C7_temp[2]), .A1(\C7[11] ), .A2(n603), .B0(n602), .B1(
        n601), .Y(n607) );
  OR2XL U860 ( .A(C6_temp[9]), .B(n675), .Y(n677) );
  OR2XL U861 ( .A(C2_temp[9]), .B(n476), .Y(n478) );
  OR2XL U862 ( .A(C4_temp[9]), .B(n526), .Y(n528) );
  OR2XL U863 ( .A(C2_temp[7]), .B(n472), .Y(n474) );
  OR2XL U864 ( .A(C6_temp[7]), .B(n671), .Y(n673) );
  OR2XL U865 ( .A(C4_temp[7]), .B(n522), .Y(n524) );
  OR2XL U866 ( .A(C8_temp[7]), .B(n620), .Y(n622) );
  OR2XL U867 ( .A(C8_temp[9]), .B(n624), .Y(n626) );
  OAI211X2 U868 ( .A0(n899), .A1(n898), .B0(n897), .C0(n896), .Y(n900) );
  OAI211X2 U869 ( .A0(n903), .A1(n902), .B0(n901), .C0(n900), .Y(n917) );
  OAI2BB1X2 U870 ( .A0N(n872), .A1N(n871), .B0(n870), .Y(n901) );
  NAND4X2 U871 ( .A(C6_temp[1]), .B(C6_temp[0]), .C(n377), .D(n649), .Y(n651)
         );
  NAND4X2 U872 ( .A(C8_temp[1]), .B(C8_temp[0]), .C(n376), .D(n597), .Y(n599)
         );
  NAND4X2 U873 ( .A(C4_temp[1]), .B(C4_temp[0]), .C(n373), .D(n500), .Y(n502)
         );
  BUFX20 U874 ( .A(Xt_temp[10]), .Y(n408) );
  AOI221X2 U875 ( .A0(C9_temp[6]), .A1(n902), .B0(C9_temp[4]), .B1(n884), .C0(
        n883), .Y(n897) );
  INVXL U876 ( .A(n445), .Y(n446) );
  OAI222X2 U877 ( .A0(n447), .A1(n428), .B0(X1_d[3]), .B1(n427), .C0(n426), 
        .C1(n425), .Y(n442) );
  MXI2X1 U878 ( .A(n861), .B(n331), .S0(n412), .Y(n881) );
  INVX1 U879 ( .A(n868), .Y(n902) );
  INVX1 U880 ( .A(n639), .Y(n612) );
  INVX1 U881 ( .A(n817), .Y(n819) );
  INVX1 U882 ( .A(n787), .Y(n788) );
  INVX1 U883 ( .A(n804), .Y(n805) );
  INVX1 U884 ( .A(n814), .Y(n816) );
  INVX1 U885 ( .A(n748), .Y(n749) );
  INVX1 U886 ( .A(n784), .Y(n785) );
  INVX1 U887 ( .A(n761), .Y(n762) );
  AOI2BB2X1 U888 ( .B0(n782), .B1(n565), .A0N(n789), .A1N(n787), .Y(n573) );
  INVX1 U889 ( .A(n751), .Y(n752) );
  OAI2BB1X1 U890 ( .A0N(n815), .A1N(n814), .B0(n724), .Y(n736) );
  INVX1 U891 ( .A(n723), .Y(n734) );
  INVX1 U892 ( .A(n712), .Y(n705) );
  OAI21X4 U893 ( .A0(n920), .A1(n386), .B0(n834), .Y(n919) );
  INVX1 U894 ( .A(n579), .Y(n590) );
  INVX1 U895 ( .A(n714), .Y(n786) );
  INVX1 U896 ( .A(n713), .Y(n780) );
  INVX1 U897 ( .A(n729), .Y(n815) );
  AOI2BB1X1 U898 ( .A0N(n730), .A1N(n814), .B0(n729), .Y(n732) );
  INVX1 U899 ( .A(n585), .Y(n818) );
  INVX1 U900 ( .A(n700), .Y(n745) );
  INVX1 U901 ( .A(n553), .Y(n743) );
  OAI2BB1X1 U902 ( .A0N(n341), .A1N(n809), .B0(n723), .Y(n735) );
  INVX1 U903 ( .A(n638), .Y(n634) );
  INVX1 U904 ( .A(n654), .Y(n658) );
  INVX1 U905 ( .A(n521), .Y(n525) );
  INVX1 U906 ( .A(n619), .Y(n623) );
  INVX1 U907 ( .A(n471), .Y(n475) );
  INVX1 U908 ( .A(n490), .Y(n485) );
  NOR2X4 U909 ( .A(n596), .B(n839), .Y(n389) );
  INVX1 U910 ( .A(n466), .Y(n467) );
  INVX1 U911 ( .A(n758), .Y(n760) );
  INVX1 U912 ( .A(n755), .Y(n757) );
  INVX1 U913 ( .A(C4_temp[3]), .Y(n504) );
  INVX1 U914 ( .A(C8_temp[3]), .Y(n601) );
  INVX1 U915 ( .A(C6_temp[3]), .Y(n653) );
  INVX1 U916 ( .A(C2_temp[3]), .Y(n454) );
  INVX1 U917 ( .A(n698), .Y(n750) );
  OAI22X1 U918 ( .A0(C5_temp[2]), .A1(n841), .B0(C6_temp[2]), .B1(n721), .Y(
        n698) );
  INVX1 U919 ( .A(n551), .Y(n753) );
  OAI2BB1X1 U920 ( .A0N(C8_temp[5]), .A1N(n375), .B0(n342), .Y(n616) );
  INVX1 U921 ( .A(C1_temp[9]), .Y(n476) );
  INVX1 U922 ( .A(C8_temp[8]), .Y(n621) );
  INVX1 U923 ( .A(C6_temp[8]), .Y(n672) );
  INVX1 U924 ( .A(C4_temp[8]), .Y(n523) );
  INVX1 U925 ( .A(C2_temp[8]), .Y(n473) );
  INVX1 U926 ( .A(C3_temp[9]), .Y(n526) );
  OR2X2 U927 ( .A(C5_temp[10]), .B(n398), .Y(n665) );
  NOR2BX1 U928 ( .AN(C6_temp[6]), .B(n684), .Y(n693) );
  INVX1 U929 ( .A(n577), .Y(n808) );
  INVX1 U930 ( .A(C4_temp[2]), .Y(n506) );
  INVX1 U931 ( .A(C6_temp[6]), .Y(n685) );
  INVX1 U932 ( .A(C2_temp[6]), .Y(n487) );
  INVX1 U933 ( .A(C8_temp[6]), .Y(n636) );
  INVX1 U934 ( .A(C4_temp[6]), .Y(n536) );
  INVX1 U935 ( .A(C7_temp[7]), .Y(n620) );
  INVX1 U936 ( .A(C5_temp[7]), .Y(n671) );
  INVX1 U937 ( .A(C7_temp[4]), .Y(n629) );
  INVX1 U938 ( .A(C5_temp[4]), .Y(n680) );
  INVX1 U939 ( .A(C3_temp[4]), .Y(n531) );
  INVX1 U940 ( .A(C1_temp[4]), .Y(n481) );
  INVX1 U941 ( .A(C8_temp[2]), .Y(n603) );
  INVX1 U942 ( .A(C6_temp[2]), .Y(n655) );
  INVX1 U943 ( .A(C2_temp[2]), .Y(n456) );
  INVX1 U944 ( .A(C7_temp[2]), .Y(n604) );
  INVX1 U945 ( .A(C5_temp[2]), .Y(n656) );
  INVX1 U946 ( .A(C3_temp[2]), .Y(n507) );
  INVX1 U947 ( .A(C1_temp[2]), .Y(n457) );
  INVX1 U948 ( .A(n981), .Y(n984) );
  INVX1 U949 ( .A(n701), .Y(n756) );
  OAI22X1 U950 ( .A0(C7_temp[0]), .A1(n337), .B0(C8_temp[0]), .B1(n332), .Y(
        n701) );
  INVX1 U951 ( .A(n554), .Y(n759) );
  INVX1 U952 ( .A(C7_temp[0]), .Y(n597) );
  INVX1 U953 ( .A(C1_temp[0]), .Y(n450) );
  INVX1 U954 ( .A(C5_temp[0]), .Y(n649) );
  INVX1 U955 ( .A(n421), .Y(n413) );
  INVX1 U956 ( .A(n421), .Y(n414) );
  INVX1 U957 ( .A(n421), .Y(n415) );
  INVX1 U958 ( .A(n421), .Y(n416) );
  INVX1 U959 ( .A(n421), .Y(n417) );
  INVX1 U960 ( .A(n421), .Y(n419) );
  INVX1 U961 ( .A(n421), .Y(n418) );
  INVX1 U962 ( .A(n421), .Y(n420) );
  INVX1 U963 ( .A(C9_temp[3]), .Y(n877) );
  INVX1 U964 ( .A(n886), .Y(n878) );
  OR4X2 U965 ( .A(n895), .B(n894), .C(n898), .D(n893), .Y(n896) );
  INVX1 U966 ( .A(C9_temp[10]), .Y(n916) );
  INVX1 U967 ( .A(C9_temp[4]), .Y(n869) );
  INVX1 U968 ( .A(C9_temp[6]), .Y(n870) );
  INVX1 U969 ( .A(C9_temp[2]), .Y(n885) );
  INVX1 U970 ( .A(n1000), .Y(n421) );
  INVX1 U971 ( .A(X9[3]), .Y(n427) );
  XNOR3X2 U972 ( .A(X9[7]), .B(X1_d[7]), .C(n435), .Y(N24) );
  INVX1 U973 ( .A(X9[6]), .Y(n432) );
  AOI2BB2X1 U974 ( .B0(X6[0]), .B1(n381), .A0N(n963), .A1N(n962), .Y(n967) );
  INVX1 U975 ( .A(X5[0]), .Y(n962) );
  INVX1 U976 ( .A(X5[1]), .Y(n953) );
  AOI2BB2X1 U977 ( .B0(X8[0]), .B1(n384), .A0N(n965), .A1N(n964), .Y(n966) );
  INVX1 U978 ( .A(X7[0]), .Y(n964) );
  AOI2BB2X1 U979 ( .B0(X8[3]), .B1(n384), .A0N(n965), .A1N(n939), .Y(n940) );
  INVX1 U980 ( .A(X7[3]), .Y(n939) );
  INVX1 U981 ( .A(X7[1]), .Y(n954) );
  NAND2BX1 U982 ( .AN(X1_d[2]), .B(n303), .Y(n445) );
  NAND2BX1 U983 ( .AN(X1_d[5]), .B(n372), .Y(n438) );
  INVX1 U984 ( .A(X3[1]), .Y(n952) );
  INVX1 U985 ( .A(X1[1]), .Y(n951) );
  INVX1 U986 ( .A(reset), .Y(n1000) );
  AOI222X2 U987 ( .A0(n918), .A1(n917), .B0(n385), .B1(n916), .C0(n915), .C1(
        n914), .Y(n921) );
  OAI22XL U988 ( .A0(C5_temp[10]), .A1(n841), .B0(C6_temp[10]), .B1(n721), .Y(
        n722) );
  INVX2 U989 ( .A(n880), .Y(n898) );
  INVX1 U990 ( .A(n882), .Y(n883) );
  INVX4 U991 ( .A(n803), .Y(n824) );
  OAI2BB1XL U992 ( .A0N(n818), .A1N(n817), .B0(n580), .Y(n592) );
  NAND3XL U993 ( .A(n568), .B(n569), .C(n570), .Y(n572) );
  NAND3XL U994 ( .A(n412), .B(n411), .C(n844), .Y(n965) );
  OR2XL U995 ( .A(n741), .B(n842), .Y(n920) );
  NAND3XL U996 ( .A(n837), .B(n836), .C(n339), .Y(n960) );
  NAND3XL U997 ( .A(n410), .B(n839), .C(n339), .Y(n961) );
  NAND3XL U998 ( .A(n412), .B(n843), .C(n842), .Y(n963) );
  OAI222X4 U999 ( .A0(n978), .A1(n982), .B0(n977), .B1(n976), .C0(n975), .C1(
        n974), .Y(n980) );
  OAI32X4 U1000 ( .A0(n499), .A1(n498), .A2(n497), .B0(\C1[11] ), .B1(n550), 
        .Y(n836) );
  AND2X2 U1001 ( .A(n445), .B(n444), .Y(n426) );
  OR2X2 U1002 ( .A(X1_d[4]), .B(n429), .Y(n437) );
  NAND3X1 U1003 ( .A(n438), .B(n436), .C(n437), .Y(n430) );
  XOR3X2 U1004 ( .A(n372), .B(X1_d[5]), .C(n395), .Y(N22) );
  AOI2BB1X2 U1005 ( .A0N(n397), .A1N(n447), .B0(n446), .Y(n448) );
  XOR3X2 U1006 ( .A(n303), .B(X1_d[2]), .C(n397), .Y(N19) );
  OR2X2 U1007 ( .A(C1_temp[1]), .B(\C1[11] ), .Y(n453) );
  NAND4X1 U1008 ( .A(C2_temp[1]), .B(C2_temp[0]), .C(n465), .D(n450), .Y(n452)
         );
  AND2X2 U1009 ( .A(C2_temp[0]), .B(n450), .Y(n451) );
  OR2X2 U1010 ( .A(C1_temp[3]), .B(\C1[11] ), .Y(n455) );
  OR2X2 U1011 ( .A(C1_temp[10]), .B(\C1[11] ), .Y(n466) );
  OR2X2 U1012 ( .A(C1_temp[6]), .B(\C1[11] ), .Y(n484) );
  OR2X2 U1013 ( .A(n487), .B(n484), .Y(n463) );
  NAND3X1 U1014 ( .A(C2_temp[4]), .B(n465), .C(n481), .Y(n462) );
  OR2X2 U1015 ( .A(C1_temp[8]), .B(\C1[11] ), .Y(n471) );
  AOI31X1 U1016 ( .A0(n480), .A1(n479), .A2(n478), .B0(n477), .Y(n498) );
  OR2X2 U1017 ( .A(C2_temp[4]), .B(n481), .Y(n483) );
  OR2X2 U1018 ( .A(C3_temp[1]), .B(\C3[11] ), .Y(n503) );
  AND2X2 U1019 ( .A(C4_temp[0]), .B(n500), .Y(n501) );
  OR2X2 U1020 ( .A(C3_temp[3]), .B(\C3[11] ), .Y(n505) );
  OR2X2 U1021 ( .A(C3_temp[10]), .B(\C3[11] ), .Y(n516) );
  OR2X2 U1022 ( .A(C3_temp[6]), .B(\C3[11] ), .Y(n534) );
  OR2X2 U1023 ( .A(n536), .B(n534), .Y(n513) );
  NAND3X1 U1024 ( .A(C4_temp[4]), .B(n373), .C(n531), .Y(n512) );
  OR2X2 U1025 ( .A(C3_temp[8]), .B(\C3[11] ), .Y(n521) );
  NAND3X1 U1026 ( .A(C4_temp[7]), .B(n373), .C(n522), .Y(n538) );
  AOI31X1 U1027 ( .A0(n530), .A1(n529), .A2(n528), .B0(n527), .Y(n547) );
  OR2X2 U1028 ( .A(C4_temp[4]), .B(n531), .Y(n533) );
  NAND3X1 U1029 ( .A(n537), .B(n540), .C(n534), .Y(n544) );
  NAND3X1 U1030 ( .A(n537), .B(n536), .C(n535), .Y(n542) );
  NAND3X1 U1031 ( .A(n753), .B(n751), .C(n556), .Y(n561) );
  AND2X2 U1032 ( .A(n586), .B(n817), .Y(n587) );
  OR2X2 U1033 ( .A(C7_temp[1]), .B(\C7[11] ), .Y(n600) );
  AND2X2 U1034 ( .A(C8_temp[0]), .B(n597), .Y(n598) );
  OR2X2 U1035 ( .A(C7_temp[3]), .B(\C7[11] ), .Y(n602) );
  OR2X2 U1036 ( .A(C7_temp[10]), .B(\C7[11] ), .Y(n614) );
  OR2X2 U1037 ( .A(C7_temp[6]), .B(\C7[11] ), .Y(n632) );
  OR2X2 U1038 ( .A(n636), .B(n632), .Y(n610) );
  NAND3X1 U1039 ( .A(C8_temp[4]), .B(n376), .C(n629), .Y(n609) );
  OR2X2 U1040 ( .A(C7_temp[8]), .B(\C7[11] ), .Y(n619) );
  NAND3X1 U1041 ( .A(C8_temp[7]), .B(n376), .C(n620), .Y(n637) );
  OR2X2 U1042 ( .A(n612), .B(n633), .Y(n617) );
  AOI31X1 U1043 ( .A0(n628), .A1(n627), .A2(n626), .B0(n625), .Y(n646) );
  OR2X2 U1044 ( .A(C8_temp[4]), .B(n629), .Y(n631) );
  NAND3X1 U1045 ( .A(n342), .B(n639), .C(n632), .Y(n643) );
  OR2X2 U1046 ( .A(C5_temp[1]), .B(n398), .Y(n652) );
  AND2X2 U1047 ( .A(C6_temp[0]), .B(n649), .Y(n650) );
  OR2X2 U1048 ( .A(C5_temp[6]), .B(n398), .Y(n683) );
  NAND3X1 U1049 ( .A(C6_temp[4]), .B(n377), .C(n680), .Y(n661) );
  OR2X2 U1050 ( .A(C5_temp[8]), .B(n398), .Y(n670) );
  AOI31X1 U1051 ( .A0(n679), .A1(n678), .A2(n677), .B0(n676), .Y(n695) );
  OR2X2 U1052 ( .A(C6_temp[4]), .B(n680), .Y(n682) );
  AND2X2 U1053 ( .A(n344), .B(n761), .Y(n703) );
  NAND3X1 U1054 ( .A(n714), .B(n715), .C(n716), .Y(n718) );
  OR2X2 U1055 ( .A(n806), .B(n804), .Y(n723) );
  OR2X2 U1056 ( .A(n824), .B(n380), .Y(n832) );
  AOI2BB1X2 U1057 ( .A0N(n851), .A1N(n826), .B0(n850), .Y(n828) );
  AND2X2 U1058 ( .A(n826), .B(n851), .Y(n827) );
  OAI32X2 U1059 ( .A0(n833), .A1(n832), .A2(n831), .B0(n830), .B1(n380), .Y(
        n834) );
  NAND4X1 U1060 ( .A(n849), .B(n848), .C(n847), .D(n846), .Y(n923) );
  OR2X2 U1061 ( .A(n385), .B(n916), .Y(n910) );
  AND4X2 U1062 ( .A(n859), .B(n858), .C(n904), .D(n910), .Y(n918) );
  AOI31X1 U1063 ( .A0(n881), .A1(n882), .A2(n869), .B0(n865), .Y(n903) );
  AOI31X1 U1064 ( .A0(n881), .A1(n869), .A2(n882), .B0(n868), .Y(n872) );
  AND2X2 U1065 ( .A(n886), .B(n885), .Y(n895) );
  AOI31X1 U1066 ( .A0(n892), .A1(n379), .A2(C9_temp[0]), .B0(C9_temp[1]), .Y(
        n894) );
  OAI32X2 U1067 ( .A0(n909), .A1(C9_temp[7]), .A2(n908), .B0(C9_temp[8]), .B1(
        n907), .Y(n912) );
  NAND4X1 U1068 ( .A(n927), .B(n926), .C(n925), .D(n924), .Y(n928) );
  NAND4X1 U1069 ( .A(n932), .B(n931), .C(n930), .D(n929), .Y(n933) );
  NAND4X1 U1070 ( .A(n937), .B(n936), .C(n935), .D(n934), .Y(n938) );
  NAND4X1 U1071 ( .A(n943), .B(n942), .C(n941), .D(n940), .Y(n944) );
  NAND4X1 U1072 ( .A(n948), .B(n947), .C(n946), .D(n945), .Y(n949) );
  NAND4X1 U1073 ( .A(n958), .B(n957), .C(n956), .D(n955), .Y(n959) );
  NAND4X1 U1074 ( .A(n969), .B(n968), .C(n967), .D(n966), .Y(n971) );
  XOR3X2 U1075 ( .A(n997), .B(n986), .C(n985), .Y(\Y1[7] ) );
  XOR3X2 U1076 ( .A(n999), .B(n993), .C(n992), .Y(\Y1[6] ) );
  XOR3X2 U1077 ( .A(\Y1[2] ), .B(n995), .C(n994), .Y(\Y1[5] ) );
  XOR3X2 U1078 ( .A(\Y1[1] ), .B(n997), .C(n396), .Y(\Y1[4] ) );
endmodule

