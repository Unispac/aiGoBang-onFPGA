`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:41 12/31/2018 
// Design Name: 
// Module Name:    win_checker 
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
module win_checker(
	input wire [3:0] row,//上一步下棋的行数
	input wire [3:0] col,//上一步下棋的列数
	input wire [224:0] ch,//上一步下棋的棋手对应的棋面
	output wire win_check
    );
	horizontal_vertical U1 (
    .row(row), 
    .col(col), 
    .ch(ch), 
    .win_check(check1)
    );
	upper_left_to_lower_right U2 (
    .row(row), 
    .col(col), 
    .ch(ch), 
    .win_check(check2)
    );
	 lower_left_to_upper_right U3 (
    .row(row), 
    .col(col), 
    .ch(ch), 
    .win_check(check3)
    );
	assign win_check=check1||check2||check3;
	
endmodule
