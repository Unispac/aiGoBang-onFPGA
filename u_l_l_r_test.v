`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:36:41 01/02/2019
// Design Name:   upper_left_to_lower_right
// Module Name:   D:/iseproj/coursedesign/u_l_l_r_test.v
// Project Name:  coursedesign
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: upper_left_to_lower_right
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module u_l_l_r_test;

	// Inputs
	reg [3:0] row;
	reg [3:0] col;
	reg [224:0] ch;

	// Outputs
	wire win_check;

	// Instantiate the Unit Under Test (UUT)
	upper_left_to_lower_right uut (
		.row(row), 
		.col(col), 
		.ch(ch), 
		.win_check(win_check)
	);

	initial begin
		row = 0;
		col = 1;
		ch =0;
		ch[1]=1;
		ch[31]=1;
		ch[47]=1;
		ch[63]=1;
		ch[79]=1;
		#100;
		row =1;
		col =0;
		ch[15]=1;
		#100;
		ch =0;
		ch[15]=1;
		ch[17]=1;
		ch[33]=1;
		ch[49]=1;
		ch[65]=1;
		#100;
		row =0;
		col =1;
		ch[1]=1;
	end
      
endmodule

