`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:47:19 08/10/2020 
// Design Name: 
// Module Name:    nbitshifter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module nbitshifter(value,select,shift,clk,reset,out
    );
parameter bits=4;//no of bits

input [bits-1:0] value;//parrallel load
input [1:0]select,shift;////SelectA and SelectB, MSBin for rightshift,LSBin for leftshift for register
input clk,reset;//clock and reset
output reg [bits-1:0] out;//output 

//positive edge clock and reset
always @(posedge clk ,  posedge reset )
begin
if (reset)begin out<=0;  end//reseting
else begin
case (select)//selction
2'b00:  begin out<=out;   end //nochange
2'b01:  begin out<=out >> 1;     end//righshift
2'b10:  begin out<=out << 1;     end//leftshift
2'b11:  begin out<=value;  end//parrallel load
default: out<=out;//no change
endcase
end
end
endmodule



























module nbitshifter(value,select,shift,clk,reset,out
    );
parameter bits=4;//no of bits

input [bits-1:0] value;//parrallel load
input [1:0]select,shift;////SelectA and SelectB, MSBin for rightshift,LSBin for leftshift for register
input clk,reset;//clock and reset
output reg [bits-1:0] out;//output 

//positive edge clock and reset
always @(posedge clk ,  posedge reset )
begin
if (reset)begin out<=0;  end//reseting
else begin
case (select)//selction
2'b00:  begin out<=out;   end //nochange
2'b01:  begin out<=out >> 1;     end//righshift
2'b10:  begin out<=out << 1;     end//leftshift
2'b11:  begin out<=value;  end//parrallel load
default: out<=out;//no change
endcase
end
end
endmodule
