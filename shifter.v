`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:34 08/10/2020 
// Design Name: 
// Module Name:    shifter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module shifter(value,shift,select,clk,reset,state,y
,out0,out1,out2,out3,seg0,seg1,seg2,seg3    );
input [15:0] value;//input sequence 
input [1:0]shift,select;//SelectA and SelectB, MSBin for rightshift,LSBin for leftshift for registers
input clk,reset;//clock and reset
output [3:0]out0,out1,out2,out3;//output of each register
output [2:0]state;//cuurent state
output y;//output pattern detected
//we need 16 seven segment displays for this
//Note: one register values can be shown in one seven segment diplay but if the bits represent number greater 
//than 9 then it is not possible, thats why each bit as 1's and 0's is is ouputted onto th 7 seg displays
output [31:0] seg0,seg1,seg2,seg3;//for the diplay of each register 0's and 1's on sevesegment display
//registers with its values as output and also in SEVEN segment codes
//the values from R3 that getsout at the right gets in into the R2 and so on, the value of R0 that gets
//out is enter to module for pattern detector.
registerrrrr R3(value[15:12],select,shift,clk,reset,out3,seg3[7:0],seg3[15:8],seg3[23:16],seg3[31:24]);
registerrrrr R2(value[11:8],select,{1'b0,out3[0]},clk,reset,out2,seg2[7:0],seg2[15:8],seg2[23:16],seg2[31:24]);
registerrrrr R1(value[7:4],select,{1'b0,out2[0]},clk,reset,out1,seg1[7:0],seg1[15:8],seg1[23:16],seg1[31:24]);
registerrrrr R0(value[3:0],select,{1'b0,out1[0]},clk,reset,out0,seg0[7:0],seg0[15:8],seg0[23:16],seg0[31:24]);

tsk2 M1(out0[0],reset,clk,state,y);// the pattern detectot
endmodule
