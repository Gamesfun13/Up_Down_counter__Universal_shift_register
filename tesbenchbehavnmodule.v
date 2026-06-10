`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:15:31 08/06/2020
// Design Name:   behav1counterr
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/lab11/New folder/lab11ended/tesbenchbehavnmodule.v
// Project Name:  lab11ended
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: behav1counterr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tesbenchbehavnmodule;

	// Inputs
	reg A;
	reg clk;
	reg enable;
	reg reset;
	// Outputs
	wire [3:0] out;
	// Instantiate the Unit Under Test (UUT)
	behav1counterr uut (
		.A(A), 
		.clk(clk), 
		.enable(enable), 
		.reset(reset), 
		.out(out)
	);
	initial begin
		// Initialize Inputs
	   A = 0;//up count
		clk = 0;
		reset=0;  #10;
		reset=1;  #10;//reset
		reset=0;
		enable=1; #150;//enable
		enable=0; #30;//disable
		enable=1;//enable
		A=0;      #40;//upcount
		A=1;      #100;//downcount
		$finish;
	
	end
always #5 clk=~clk;   //clock
endmodule

