`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:12:49 07/27/2020
// Design Name:   tsk2
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/lab19/New folder/lab10/testbenchtask2.v
// Project Name:  lab10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: tsk2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbenchtask2;

	// Inputs
	reg value;
	reg reset;
	reg clk;

	// Outputs
	wire [2:0] currentstate;
	wire y;
   
	
   reg [15:0]seq =16'b1110110011011001;
	integer i=0;
	// Instantiate the Unit Under Test (UUT)
	tsk2 uut (
		.value(value), 
		.reset(reset), 
		.clk(clk), 
		.currentstate(currentstate), 
		.y(y)
	);

	initial begin
		         #10;
		reset=1; #10;
      reset=0; #10;
      		
		for( i=15;i>=0;i=i-1)begin
		value=seq[i];
		 clk=0; #5;
		 clk=1; #5;
		end
		$finish;
    
	end
	
	
      
endmodule

