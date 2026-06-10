`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Code Developed by: Dr. Muhammad Faisal Siddiqui
// 
// Create Date:    14:29:27 01/31/2018 
// Design Name: 
// Module Name:    test_pattern 
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
module test_pattern(seq_d,s_out,add,clk,rst);

output reg s_out,seq_d;
input [1:0]add;
input clk,rst;
parameter P1=4'b1010,P2=4'b0101,P3=4'b1100,P4=4'b0011;//<-
parameter n=3;
reg [n-1:0]count;

always @(posedge clk or posedge rst)
begin
	if(rst)
		begin
		s_out=0;
		count=0;
		seq_d=0;
	end
	else
		begin
		
			if (count <=3)
			begin
			seq_d=0;
			case (add)
			0:	s_out=P1[count];
			1:	s_out=P2[count];
			2:	s_out=P3[count];
			3:	s_out=P4[count];
			default: s_out=P1[count];
			endcase
			if (count==3)
				seq_d=1;
			count=count+1;
			end
			else
			seq_d=1;
	end
end
endmodule











