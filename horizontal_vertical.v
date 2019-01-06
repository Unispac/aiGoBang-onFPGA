`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:40 12/31/2018 
// Design Name: 
// Module Name:    horizontal_vertical 
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
module horizontal_vertical(
	input wire [3:0] row,//上一步下棋的行数
	input wire [3:0] col,//上一步下棋的列数
	input wire [224:0] ch,//上一步下棋的棋手对应的棋面
	output reg win_check
    );
	always @(*) begin
		if((ch[row*15]&&ch[row*15+1]&&ch[row*15+2]&&ch[row*15+3]&&ch[row*15+4])||
			(ch[row*15+1]&&ch[row*15+2]&&ch[row*15+3]&&ch[row*15+4]&&ch[row*15+5])||
			(ch[row*15+2]&&ch[row*15+3]&&ch[row*15+4]&&ch[row*15+5]&&ch[row*15+6])||
			(ch[row*15+3]&&ch[row*15+4]&&ch[row*15+5]&&ch[row*15+6]&&ch[row*15+7])||
			(ch[row*15+4]&&ch[row*15+5]&&ch[row*15+6]&&ch[row*15+7]&&ch[row*15+8])||
			(ch[row*15+5]&&ch[row*15+6]&&ch[row*15+7]&&ch[row*15+8]&&ch[row*15+9])||
			(ch[row*15+6]&&ch[row*15+7]&&ch[row*15+8]&&ch[row*15+9]&&ch[row*15+10])||
			(ch[row*15+7]&&ch[row*15+8]&&ch[row*15+9]&&ch[row*15+10]&&ch[row*15+11])||
			(ch[row*15+8]&&ch[row*15+9]&&ch[row*15+10]&&ch[row*15+11]&&ch[row*15+12])||
			(ch[row*15+9]&&ch[row*15+10]&&ch[row*15+11]&&ch[row*15+12]&&ch[row*15+13])||
			(ch[row*15+10]&&ch[row*15+11]&&ch[row*15+12]&&ch[row*15+13]&&ch[row*15+14]))
			win_check = 1'b1;//横向判定
		else if((ch[col+15]&&ch[col+15*1]&&ch[col+15*2]&&ch[col+15*3]&&ch[col+15*4])||
				(ch[col+15*1]&&ch[col+15*2]&&ch[col+15*3]&&ch[col+15*4]&&ch[col+15*5])||
				(ch[col+15*2]&&ch[col+15*3]&&ch[col+15*4]&&ch[col+15*5]&&ch[col+15*6])||
				(ch[col+15*3]&&ch[col+15*4]&&ch[col+15*5]&&ch[col+15*6]&&ch[col+15*7])||
				(ch[col+15*4]&&ch[col+15*5]&&ch[col+15*6]&&ch[col+15*7]&&ch[col+15*8])||
				(ch[col+15*5]&&ch[col+15*6]&&ch[col+15*7]&&ch[col+15*8]&&ch[col+15*9])||
				(ch[col+15*6]&&ch[col+15*7]&&ch[col+15*8]&&ch[col+15*9]&&ch[col+15*10])||
				(ch[col+15*7]&&ch[col+15*8]&&ch[col+15*9]&&ch[col+15*10]&&ch[col+15*11])||
				(ch[col+15*8]&&ch[col+15*9]&&ch[col+15*10]&&ch[col+15*11]&&ch[col+15*12])||
				(ch[col+15*9]&&ch[col+15*10]&&ch[col+15*11]&&ch[col+15*12]&&ch[col+15*13])||
				(ch[col+15*10]&&ch[col+15*11]&&ch[col+15*12]&&ch[col+15*13]&&ch[col+15*14]))
				win_check = 1'b1;//纵向判定
		else win_check =1'b0;
	end
endmodule
