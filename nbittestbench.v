`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:07:28 08/10/2020
// Design Name:   nbitshifter
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/lab11/New folder/lab11ended/nbittestbench.v
// Project Name:  lab11ended
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nbitshifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module nbittestbench;
	// Inputs
	reg [3:0] value;
	reg [1:0] select;
	reg [1:0] shift;
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] out;

	// Instantiate the Unit Under Test (UUT)
	nbitshifter uut (
		.value(value), 
		.select(select), 
		.shift(shift), 
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		value = 0;//parrallel load
		select = 0;// selection no change
		shift = 0; //MSBin, LSBin, both zero
		clk = 0;
		reset = 0;   #10;
		reset =1; #10;//reset
		reset=0;
		select=2'b11;//slection mode parrallel load
      value=4'b1110;#10;//parrallel load
		select=2'b10;#30;//left shifting
       $finish;		
		
	end
      always #5 clk=~clk;
endmodule

