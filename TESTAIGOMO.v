`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:17:18 01/06/2019
// Design Name:   aiGo
// Module Name:   C:/Users/41616/Desktop/AIgoBang/coursedesign-master/testaigomo.v
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

module testaigomo;

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
	wire [9:0] LOCAI;
	wire [9:0] LOCHM;
	wire [8:0] outState;
	wire valid;
	wire isEmpty;
	wire [31:0] MAXAI;
	wire [31:0] MAXHM;

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
		.LOCAI(LOCAI), 
		.LOCHM(LOCHM), 
		.outState(outState), 
		.valid(valid), 
		.isEmpty(isEmpty), 
		.MAXAI(MAXAI), 
		.MAXHM(MAXHM)
	);


	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;
		humanIn = 0;
		enable = 0;
		
		#5;
		reset=0;
		
		#5;
		reset=1;
		
		#5;
		enable=1;
		// Wait 100 ns for global reset to finish
	
		
		
		// Add stimulus here
	end
	
	always begin
		clk=0;#1;
		clk=1;#1;
		
	end
      
      
endmodule

