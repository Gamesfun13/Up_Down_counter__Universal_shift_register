`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:16 08/08/2020 
// Design Name: 
// Module Name:    registerrrrr 
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
module registerrrrr(  par_load,select,shift,clk,reset,out,seg0,seg1,seg2,seg3);
input clk,reset;
assign anode=4'b1111;//for SEVENsegmentDisp on FPGA
input [1:0]select,shift;//SelectA and SelectB, MSBin for rightshift,LSBin for leftshift 
input [3:0]par_load;//parrallel load
output [3:0]out;//output
//every register will requires 4 seven segment display to diplay register values in 1's and 0's
output [7:0]seg0,seg1,seg2,seg3;//one for each bit of 4bit shift register

wire [3:0]temp;//for output of flipflops
wire [3:0]temp2;//for output of multiplexers

wire [3:0]multiD;//for multiplexer of Dflipflop
wire [3:0]multiC;//for multiplexer of Cflipflop
wire [3:0]multiB;//for multiplexer of Bflipflop
wire [3:0]multiA;//for multiplexer of Aflipflop


assign multiD={par_load[0],shift[1],temp[1],temp[0]};//option for MuxD
multiplexerrrr MD(multiD,select,temp2[0]);//mux for Dflipflop

assign multiC={par_load[1],temp[0],temp[2],temp[1]};//option for MuxC
multiplexerrrr MC(multiC,select,temp2[1]);//mux for Cflipflop

assign multiB={par_load[2],temp[1],temp[3],temp[2]};//option for MuxB
multiplexerrrr MB(multiB,select,temp2[2]);//mux for Bflipflop

assign multiA={par_load[3],temp[2],shift[0],temp[3]};//option for MuxA
multiplexerrrr MA(multiA,select,temp2[3]);//mux for Aflipflop

dflipflop flipD(temp[0],temp2[0],clk,reset);//flipflopD
dflipflop flipC(temp[1],temp2[1],clk,reset);//flipflopC
dflipflop flipB(temp[2],temp2[2],clk,reset);//flipflopB
dflipflop flipA(temp[3],temp2[3],clk,reset);//flipflopA

 assign out[3:0]= temp[3:0];
 bcdto7segment BCD0({1'b0,1'b0,1'b0,out[0]},seg0);//output of flipflopD in seven segment
 bcdto7segment BCD1({1'b0,1'b0,1'b0,out[1]},seg1);//output of flipflopC in seven segment
 bcdto7segment BCD2({1'b0,1'b0,1'b0,out[2]},seg2);//output of flipflopB in seven segment
 bcdto7segment BCD3({1'b0,1'b0,1'b0,out[3]},seg3);//output of flipflopA in seven segment
endmodule
