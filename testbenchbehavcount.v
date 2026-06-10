`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:02:44 08/06/2020
// Design Name:   behavcounter
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/lab11/New folder/lab11ended/testbenchbehavcount.v
// Project Name:  lab11ended
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: behavcounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbenchbehavcount;
	// Inputs
	reg A;
	reg enable;
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] state;
   wire [7:0]seg;
	// Instantiate the Unit Under Test (UUT)
	behavcounter uut (
		.A(A), 
		.enable(enable), 
		.clk(clk), 
		.reset(reset), 
		.state(state),
		.seg(seg)
	);
	initial begin
		// Initialize Inputs
		A = 0;     //upcount
		clk = 0;
		reset=0;   #10;
		reset=1;   #10;//reset
		reset=0;
		enable=1;  #150;//enabled
		enable=0;  #30; //disabled
		enable=1;       //enabled
		A=1;       #150;//downcount
	
		$finish;
	end
   always #5 clk=~clk;   //clock
endmodule

