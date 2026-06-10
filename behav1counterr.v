`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:02:04 08/06/2020 
// Design Name: 
// Module Name:    behav1counterr 
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
module behav1counterr(
A,clk,enable,reset,out);
parameter n=4;               //no of bits
input A,clk,enable,reset;
output reg [n-1:0] out;         //output

   //positve edge clk and reset
always@( posedge clk, posedge reset )
begin
if(reset ==1)begin out<=0; end            //reset
else if(enable==0)begin out<=out; end    //enable/disable
else
begin 
if (A==0)begin out <=out+1; end       //upcount
else begin out<=out-1; end           //down count
end
end
endmodule
