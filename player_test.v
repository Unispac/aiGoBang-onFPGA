`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:37:44 01/03/2019
// Design Name:   player
// Module Name:   D:/iseproj/coursedesign/player_test.v
// Project Name:  coursedesign
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: player
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module player_test;

	// Inputs
	reg clk;
	reg rst;
	reg ps2_clk;
	reg ps2_data;
	reg is_player;
	reg have_chess;

	// Outputs
	wire [224:0] disp;
	wire [3:0] choose_row;
	wire [3:0] choose_col;
	wire pressed;

	// Instantiate the Unit Under Test (UUT)
	player uut (
		.clk(clk), 
		.rst(rst), 
		.ps2_clk(ps2_clk), 
		.ps2_data(ps2_data), 
		.is_player(is_player), 
		.have_chess(have_chess), 
		.disp(disp), 
		.choose_row(choose_row), 
		.choose_col(choose_col), 
		.pressed(pressed)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		ps2_clk = 0;
		ps2_data = 0;
		is_player = 0;
		have_chess = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

