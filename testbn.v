`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:54:26 08/05/2020
// Design Name:   updowncounterr
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/lab11/New folder/lab11ended/testbn.v
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

module testbn;
	// Inputs
	reg A;
	reg clk;
   reg rst;
	reg enable;
	// Outputs
	wire [3:0] out;
	wire [7:0] seg;

	// Instantiate the Unit Under Test (UUT)
	updowncounterr uut (
		.A(A), 
		.clk(clk),
      .enable(enable),		
		.out(out),
		.rst(rst),
		.seg(seg)
	);
	initial begin
		A = 0;     //upcount
		clk = 0;
		enable=0;//disabled
		rst=0;   #10;
		enable=1; //enabled
		rst=1;   #10;//reset
		rst=0;
		enable=1;  #150;//enabled
		enable=0;  #30; //disabled
		enable=1;       //enabled
		A=1;       #150;//downcount
        $finish;
	end
	always #5 clk=~clk;
endmodule

