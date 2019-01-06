`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:25:32 01/02/2019
// Design Name:   horizontal_vertical
// Module Name:   D:/iseproj/coursedesign/h_v_test.v
// Project Name:  coursedesign
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: horizontal_vertical
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module h_v_test;

	// Inputs
	reg [3:0] row;
	reg [3:0] col;
	reg [224:0] ch;

	// Outputs
	wire win_check;

	// Instantiate the Unit Under Test (UUT)
	horizontal_vertical uut (
		.row(row), 
		.col(col), 
		.ch(ch), 
		.win_check(win_check)
	);

	initial begin
		row = 0;
		col = 0;
		ch = 225'b11111;
		#100;
      ch = 225'b0;
		ch[15]=1;
		ch[30]=1;
		ch[45]=1;
		ch[60]=1;
		row =1;
		col =1;
		#100;
		ch[75]=1;
		col = 0;
		row = 5;
	end
      
endmodule

