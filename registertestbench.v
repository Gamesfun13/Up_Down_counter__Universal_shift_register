`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:52:31 08/08/2020
// Design Name:   registerrrrr
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/lab11/New folder/lab11ended/registertestbench.v
// Project Name:  lab11ended
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: registerrrrr
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module registertestbench;

	// Inputs
	reg [3:0] par_load;
	reg [1:0] select;
	reg [1:0] shift;
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] out;
	wire [7:0] seg0,seg1,seg2,seg3;
	// Instantiate the Unit Under Test (UUT)
	registerrrrr uut (
		.par_load(par_load), 
		.select(select), 
		.shift(shift), 
		.clk(clk), 
		.reset(reset), 
		.out(out),
		.seg0(seg0),
		.seg1(seg1),
		.seg2(seg2),
		.seg3(seg3)
	);

	initial begin
		// Initialize Inputs
		par_load = 0;//parrallel load 4'b0000;
		select = 0;   //select 2'b00;
		shift = 0;    //shift 2'b00;
		clk = 0;
		reset = 0;           #10; 
		reset =1;            #10;//reset
		reset=0;
      select=2'b11;         //parrallel load selection
      par_load=4'b1011;    #10;//parrallel load
		select=2'b01;        #30//rightshift selection
		select=2'b11;        //parrallel load selection  
      par_load=4'b0111;    #10;//parrallel load
		select=2'b10;        #35;//leftshift slection
		$finish;
      
	end
      
		always #5 clk=~clk;		
endmodule

