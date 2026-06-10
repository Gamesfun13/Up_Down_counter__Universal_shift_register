`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:04:36 08/05/2020
// Design Name:   updowncounterr
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/lab11/New folder/lab11ended/testbenchcounter.v
// Project Name:  lab11ended
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: updowncounterr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbenchcounter;

	// Inputs
	reg A;
	reg clk;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	updowncounterr uut (
		.A(A), 
		.clk(clk), 
		.out(out)
	);

	initial begin
		
		A = 0;
		clk=1;
		#10;
        
	

	end
always  #20 clk = ~clk;
	   
   
endmodule

