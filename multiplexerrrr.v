`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:31 08/08/2020 
// Design Name: 
// Module Name:    multiplexerrrr 
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
module multiplexerrrr(
  i,select,out  );
	 
input [3:0]i;
output reg out;

input [1:0]select;

always @(i,select)
case (select)
2'b00:   out<=i[0];
2'b01:   out<=i[1];
2'b10:   out<=i[2];
2'b11:   out<=i[3];
default: out<=1'bx;
endcase


endmodule
