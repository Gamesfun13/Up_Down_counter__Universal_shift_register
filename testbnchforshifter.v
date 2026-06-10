`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:26:53 08/10/2020
// Design Name:   shifter
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/lab11/New folder/lab11ended/testbnchforshifter.v
// Project Name:  lab11ended
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shifter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbnchforshifter;
	// Inputs
	reg [15:0] value;
	reg [1:0] shift;
	reg [1:0] select;
	reg clk;
	reg reset;

	// Outputs
	wire [2:0] state;
	wire y;
	wire [3:0] out0;
	wire [3:0] out1;
	wire [3:0] out2;
	wire [3:0] out3;
	wire [31:0]seg0,seg1,seg2,seg3;

	// Instantiate the Unit Under Test (UUT)
	shifter uut (
		.value(value), 
		.shift(shift), 
		.select(select), 
		.clk(clk), 
		.reset(reset), 
		.state(state), 
		.y(y), 
		.out0(out0), 
		.out1(out1), 
		.out2(out2), 
		.out3(out3),
		.seg0(seg0),
		.seg1(seg1),
		.seg2(seg2),
		.seg3(seg3)
	);
reg [15:0]seq =16'b1110110011011001;
	initial begin
		// Initialize Inputs
		value = 0;//input sequenc 16 bits zeros
		shift = 0;// selection no change
		select = 0;//MSBin, LSBin, both zero
		clk = 0;   
		reset = 0;		#10;
      reset = 1;     #10;//reset
		reset = 0;
		select=2'b11;//selection mode parrallel load
		value=seq;     #10;// sequence loaded
		select=2'b01;  #200;// selection mode rightshifting
		$finish;
		
	end
      always #5 clk=~clk;
endmodule

