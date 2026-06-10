`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:59:12 08/06/2020 
// Design Name: 
// Module Name:    behavcounter 
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
module behavcounter(
   A,enable,clk,reset,state,seg );
parameter A0=4'b0000,A1=4'b0001,A2=4'b0010,A3=4'b0011,A4=4'b0100,A5=4'b0101,
A6=4'b0110,A7=4'b0111,A8=4'b1000,A9=4'b1001;//the 9 states
assign anode=4'b0001;//for SEVENsegmentDisp on FPGA
output reg [3:0]state;//the cuurentstate output
output [7:0]seg;//seven segment output
input A,reset,clk,enable;//inout, enable,clock,reset

//positive edge clock and reset and negative edge enable
always@(posedge clk or posedge reset or negedge enable)
begin
if(reset==1)begin state<=A0; end//reset
else if(enable==0)begin  state<=state;  end//enable/disable
else 
begin
case (state)
//states with coresponding next states according to inpuy
//A zero =up count /  A one=down count
A0:begin  if(A==0)begin state<=A1; end  else begin state<=A9; end end 
A1:begin  if(A==0)begin state<=A2; end  else begin state<=A0; end end 
A2:begin  if(A==0)begin state<=A3; end  else begin state<=A1; end end
A3:begin  if(A==0)begin state<=A4; end  else begin state<=A2; end end
A4:begin  if(A==0)begin state<=A5; end  else begin state<=A3; end end
A5:begin  if(A==0)begin state<=A6; end  else begin state<=A4; end end
A6:begin  if(A==0)begin state<=A7; end  else begin state<=A5; end end
A7:begin  if(A==0)begin state<=A8; end  else begin state<=A6; end end
A8:begin  if(A==0)begin state<=A9; end  else begin state<=A7; end end
A9:begin  if(A==0)begin state<=A0; end  else begin state<=A8; end end
default: state<=4'bxxxx;//default state
endcase
end
end
bcdto7segment BC1(state,seg);// for seven segment output
endmodule
