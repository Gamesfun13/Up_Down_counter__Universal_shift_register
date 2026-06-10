`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:27 08/10/2020 
// Design Name: 
// Module Name:    shiftmodule 
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
module shiftmodule(
 value,select,shift,clk,reset,state,y,out   );

input [3:0]value;	 
input clk,reset;
input [1:0]select;

output [2:0]state;
output y;
input [1:0]shift;

output [3:0]out;

registerrrrr R1(value,select,shift,clk,reset,out);
tsk2 M1(out[0],reset,clk,state,y);

endmodule
