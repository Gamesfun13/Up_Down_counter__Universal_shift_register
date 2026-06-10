`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:39:44 08/10/2020
// Design Name:   shiftmodule
// Module Name:   C:/Users/Arno/Desktop/New folder/labs/lab11/New folder/lab11ended/shiftingtestbench.v
// Project Name:  lab11ended
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shiftmodule
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shiftingtestbench;

	// Inputs
	reg [3:0] value;
	reg [1:0]select;
	reg [1:0]shift;
	reg clk;
	reg reset;

	// Outputs
	wire [2:0] state;
	wire y;
   wire [3:0]out;
   reg [15:0]seq =16'b1110110011011001;
	// Instantiate the Unit Under Test (UUT)
	shiftmodule uut (
		.value(value), 
		.select(select),
       .shift(shift),		
		.clk(clk), 
		.reset(reset), 
		.state(state), 
		.y(y),
		.out(out)
	);

integer i=11;
	initial begin
	
		value = 0;
		select = 0;
		clk = 0;
		shift=0;
		reset = 0;  #10;
		reset =1;   #10;
		reset=0;
      select=2'b11;
		
		value = seq[15:12];#10;
		select=2'b01; #150;
		$finish;
      		


	end
	//if(i[3:0]==0)begin  shift[1:0]=0; end

	always #10 begin if(i>=0)begin shift[0]=seq[i]; i=i-1; end else begin  shift[0]=1'b0;  end end
   
      always #5 clk=~clk;
endmodule

