`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:32:07 01/05/2019
// Design Name:   judgeChessForm
// Module Name:   C:/Users/41616/Desktop/AIgoBang/coursedesign-master/testJudgeModule.v
// Project Name:  coursedesign
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: judgeChessForm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testJudgeModule;

	// Inputs
	reg clk;
	reg [8:0] A;
	reg [8:0] B;

	// Outputs
	wire [2:0] typeOut;

	// Instantiate the Unit Under Test (UUT)
	judgeChessForm uut (
		.clk(clk), 
		.A(A), 
		.B(B), 
		.typeOut(typeOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		A = 9'b00011110;
		B = 9'b00000001;
		// Wait 100 ns for global reset to finish
		#10;
      A = 9'b000111000;
		B = 9'b001000100;
		#10;
		A = 9'b000111000;
		B = 9'b001000000;
		// Add stimulus here

	end
	
	always begin
		clk=0;#1;
		clk=1;#1;
	end
      
endmodule

