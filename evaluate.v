`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:19:58 01/04/2019 
// Design Name: 
// Module Name:    evaluate 
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
module evaluate(input wire [2:0]state,output reg [31:0]score);

integer i;

always @ (*)
begin
	for(i=0;i<32;i=i+1)
	begin
		if(state==7&&i==25)score[i]<=1;
		else if(state==6&&i==20)score[i]<=1;
		else if(state==5&&i==17)score[i]<=1;
		else if(state==4&&(i==16||i==17))score[i]<=1;
		else if(state==3&&i==15)score[i]<=1;
		else if(state==2&&i==13)score[i]<=1;
		else if(state==1&&i==12)score[i]<=1;
		else score[i]<=0;
	end
end
endmodule
