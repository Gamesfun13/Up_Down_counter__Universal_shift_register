`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:40:04 07/26/2020 
// Design Name: 
// Module Name:    TASK2 
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
module dflipfop(Q,D,clk,rst
    );
output reg Q;
input D,clk,rst;
always@(posedge clk or posedge rst)
begin 
if(rst)
   Q<=1'b0;
else
   Q<=D;
end
endmodule
