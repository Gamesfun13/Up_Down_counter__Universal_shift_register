`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:34:45 08/05/2020 
// Design Name: 
// Module Name:    updowncounterr 
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
module updowncounterr(A,clk,enable,out,rst,seg);
assign anode=4'b0001;//for SEVENsegmentDisp on FPGA
output [3:0]out;  //output
input A,clk,rst,enable;//input,reset,enable and clock
output [7:0]seg;//seven segment output
wire [4:0]dash;//for the inverse of state and input
wire [3:0]B; //temprorary between the outputs of fliflop and inputs to gates and inturn the fliflops
wire secClk;

and clk1(secClk,clk,enable);//clock optimized for enable/disable

not n1(dash[4],A);//Adash
not n2(dash[3],B[3]);//Bdash
not n3(dash[2],B[2]);//Cdash
not n4(dash[1],B[1]);//Ddash
not n5(dash[0],B[0]);//Edash

wire  [5:0]Dr;//for Dflipflop
and D1(Dr[0],dash[4],B[1],dash[0]);
and D2(Dr[1],A,B[1],B[0]);
and D3(Dr[2],A,B[3],dash[0]);
and D4(Dr[3],dash[4],dash[3],dash[1],B[0]);
and D5(Dr[4],A,B[2],dash[1],dash[0]);
or Dflip(Dr[5],Dr[0],Dr[1],Dr[2],Dr[3],Dr[4]);

wire [5:0]Cr;//for Cflilop
and C1(Cr[0],dash[4],B[2],dash[1]);
and C2(Cr[1],B[2],B[1],dash[0]);
and C3(Cr[2],A,B[2],B[0]);
and C4(Cr[3],A,B[3],dash[0]);
and C5(Cr[4],dash[4],dash[2],B[1],B[0]);
or Cflip(Cr[5],Cr[0],Cr[1],Cr[2],Cr[3],Cr[4]);

wire [4:0] Br; //for Bflipflop
and B1(Br[0],dash[4],B[3],dash[0]);
and B2(Br[1],A,B[3],B[0]);
and B3(Br[2],dash[4],B[2],B[1],B[0]);
and B4(Br[3],A,dash[3],dash[2],dash[1],dash[0]);
or  Bflip(Br[4],Br[3],Br[2],Br[1],Br[0]);

//E,D,C,B fliflops
dflipflop Eflop(B[0],dash[0],secClk,rst);
dflipflop Dflop(B[1],Dr[5],secClk,rst);
dflipflop Cflop(B[2],Cr[5],secClk,rst);
dflipflop Bflop(B[3],Br[4],secClk,rst);

assign out[3:0]={B[3],B[2],B[1],B[0]};//ouput assigned
bcdto7segment bcd1(out,seg);//sevensegment output calculated and assigned

endmodule
