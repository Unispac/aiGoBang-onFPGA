`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:03:02 12/29/2018 
// Design Name: 
// Module Name:    chesspiece 
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
module chess_piece(
	input wire clk,
	input wire [9:0] x,	
	input wire [9:0] y,
	input wire [3:0] row,
	input wire [3:0] col,
	output reg judge
    );
	localparam GRID_X_BEGIN = 80,
               GRID_X_END = 559,
               GRID_Y_BEGIN = 0,
               GRID_Y_END = 479,
					GRID_SIZE = 31,
					SIDE_X_BEGIN = 102,
					SIDE_X_END = 536,
					SIDE_Y_BEGIN = 23,
					SIDE_Y_END = 457;
					
	reg [9:0] radius= 10'd15;
	wire [19:0] x_sqr,y_sqr,r_sqr;
	
	assign x_sqr=(x-SIDE_X_BEGIN-col*GRID_SIZE)*(x-SIDE_X_BEGIN-col*GRID_SIZE);
	assign y_sqr=(y-SIDE_Y_BEGIN-row*GRID_SIZE)*(y-SIDE_Y_BEGIN-row*GRID_SIZE);
	assign r_sqr=radius*radius;
	
	always@(*) begin
		if(x_sqr + y_sqr < r_sqr)
			judge <= 1'b1;
		else judge <= 1'b0;
	end		
endmodule
