`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Code Developed by: Dr. Muhammad Faisal Siddiqui
// 
// Create Date:    14:29:27 01/31/2018 
// Design Name: 
// Module Name:    clk_1s
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

module clk_dvsr(clk_1s,clk,rst);

parameter n=25;
parameter N=25000000;
input clk,rst;
reg [n-1:0]count;
output reg  clk_1s;

always @ (posedge clk or posedge rst)
begin
	if(rst==1) 
		count=0;
		
	else
	begin
	if(count==N-1)
			clk_1s=~clk_1s;
	count=count+1;
	end
end

endmodule























module behavcounter(
   clk,reset,state);
parameter A0=4'b0000,A1=4'b0001,A2=4'b0010,A3=4'b0011,A4=4'b0100,A5=4'b0101,
A6=4'b0110,A7=4'b0111,A8=4'b1000,A9=4'b1001;
output reg [3:0]state;
input reset,clk;


always@(posedge clk or posedge reset)
begin
if(reset==1)begin state<=A0; end//reset
else 
begin
case (state)
A0:begin  state<=A1;   end 
A1:begin  state<=A2; end   
A2:begin   state<=A3; end 
A3:begin   state<=A4; end 
A4:begin  state<=A5; end  
A5:begin  state<=A6; end  
A6:begin state<=A7; end  
A7:begin   state<=A8; end  
A8:begin  state<=A9; end
A9:begin  state<=A0; end 
default: state<=4'bxxxx;
endcase
end
end
endmodule








module testbenchbehavcount;
	// Inputs

	reg clk;
	reg reset;

	// Outputs
	wire [3:0] state;

	// Instantiate the Unit Under Test (UUT)
	behavcounter uut ( 
		.clk(clk), 
		.reset(reset), 
		.state(state),
	
	);
	initial begin
		// Initialize Inputs  
	   clk=0;
		reset=0;   #10;
		reset=1;   #10;//reset
		reset=0;   #150;
	
	
		$finish;
	end
   always #5 clk=~clk;   //clock
endmodule




































module registerrrrr(  par_load,select,shift,clk,reset,out);
input clk,reset;

input [1:0]select,shift;
input [3:0]par_load;
output [3:0]out;

wire [3:0]temp;
wire [3:0]temp2;

wire [3:0]multiD;
wire [3:0]multiC;
wire [3:0]multiB;
wire [3:0]multiA;


assign multiD={par_load[0],shift[1],temp[1],temp[0]};
multiplexerrrr MD(multiD,select,temp2[0]);

assign multiC={par_load[1],temp[0],temp[2],temp[1]};
multiplexerrrr MC(multiC,select,temp2[1]);

assign multiB={par_load[2],temp[1],temp[3],temp[2]};
multiplexerrrr MB(multiB,select,temp2[2]);

assign multiA={par_load[3],temp[2],shift[0],temp[3]};
multiplexerrrr MA(multiA,select,temp2[3]);//mux for Aflipflop

dflipflop flipD(temp[0],temp2[0],clk,reset);//flipflopD
dflipflop flipC(temp[1],temp2[1],clk,reset);//flipflopC
dflipflop flipB(temp[2],temp2[2],clk,reset);//flipflopB
dflipflop flipA(temp[3],temp2[3],clk,reset);//flipflopA

assign out[3:0]= temp[3:0];

endmodule






