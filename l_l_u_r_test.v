`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:51:57 01/02/2019
// Design Name:   lower_left_to_upper_right
// Module Name:   D:/iseproj/coursedesign/l_l_u_r_test.v
// Project Name:  coursedesign
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lower_left_to_upper_right
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module l_l_u_r_test;

	// Inputs
	reg [3:0] row;
	reg [3:0] col;
	reg [224:0] ch;

	// Outputs
	wire win_check;

	// Instantiate the Unit Under Test (UUT)
	lower_left_to_upper_right uut (
		.row(row), 
		.col(col), 
		.ch(ch), 
		.win_check(win_check)
	);

	initial begin
		row = 0;
		col = 0;
		ch = 0;
		ch[0]=1;
		ch[18]=1;
		ch[32]=1;
		ch[46]=1;
		ch[60]=1;
		#100;
		row =0;
		col = 4;
		ch[4]=1;
		#100;
		row = 0;
		col = 0;
		ch = 0;
		ch[0]=1;
		ch[27]=1;
		ch[41]=1;
		ch[55]=1;
		ch[69]=1;
		#100;
		row = 0;
		col = 13;
		ch[13]=1;
	end
      
endmodule

