`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:33:23 01/06/2019
// Design Name:   aiGo
// Module Name:   C:/Users/41616/Desktop/AIgoBang/coursedesign-master/TESTAIGO.v
// Project Name:  coursedesign
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: aiGo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TESTAIGO;

	// Inputs
	reg reset;
	reg clk;
	reg [224:0] humanIn;
	reg enable;

	// Outputs
	wire [224:0] AIOut;
	wire finish;
	wire [3:0] x;
	wire [3:0] y;
	wire [31:0] SCAI;
	wire [31:0] SCHM;
	wire [8:0] outState;

	// Instantiate the Unit Under Test (UUT)
	aiGo uut (
		.reset(reset), 
		.clk(clk), 
		.humanIn(humanIn), 
		.enable(enable), 
		.AIOut(AIOut), 
		.finish(finish), 
		.x(x), 
		.y(y), 
		.SCAI(SCAI), 
		.SCHM(SCHM), 
		.outState(outState)
	);

	initial begin
		// Initialize Inputs
		reset = 0;
		clk = 0;
		humanIn = 0;
		enable = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

