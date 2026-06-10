`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:13:34 08/05/2020
// Design Name:   dflipflop
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/lab11/New folder/lab11ended/dflipppppp.v
// Project Name:  lab11ended
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dflipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dflipppppp;

	// Inputs
	reg D;
	reg clk;
	reg rst;

	// Outputs
	wire Q;

	// Instantiate the Unit Under Test (UUT)
	dflipflop uut (
		.Q(Q), 
		.D(D), 
		.clk(clk), 
		.rst(rst)
	);

	initial begin
		// Initialize Inputs
		D = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		D=1;
      #100;
		D=0;  
		// Add stimulus here

	end
      always  #5 clk = ~clk;
	   
endmodule

