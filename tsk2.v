`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:50:25 07/26/2020 
// Design Name: 
// Module Name:    tsk2 
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

module tsk2(
   value,reset,clk,currentstate,y );
parameter A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100;//states

input value,reset,clk;//inputs
output reg y;//output
output reg [2:0]currentstate;//nextstate or output state

always@(posedge clk or posedge reset )//positive edge clock and reset
begin
if(reset==1)begin currentstate<=A; end//if reset==1 curentstate becomes A
else begin 
case (currentstate)
//coresponding state's next state based on input
A: if( value==0 )begin currentstate<=A; end else begin currentstate<=B;  end 
B: if( value==0 )begin currentstate<=A; end else begin currentstate<=C;  end  
C: if( value==0 )begin currentstate<=D; end else begin currentstate<=C;  end  
D: if( value==0 )begin currentstate<=E; end else begin currentstate<=B;  end  
E: if( value==0 )begin currentstate<=A; end else begin currentstate<=B;  end 
default: begin currentstate<=2'b00;  end
endcase
end
end

//output depends only on state
//it is declared seperately as declaring in the above blocks creates
//a bug 
always@(currentstate)
begin 
 case(currentstate) 
 A:  y <=0;
 B:  y <= 0;
 C:  y <= 0;
 D:  y <= 0;
 E:  y <= 1;//the state where output is 1
 default:  y<= 0;
 endcase
end
endmodule


























