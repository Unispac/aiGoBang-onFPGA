`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:20 01/02/2019 
// Design Name: 
// Module Name:    player 
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
module player(
	input wire clk,
	input wire rst,
	input wire ps2_clk,     // PS2 clock
   input wire ps2_data,    // PS2 data
	input wire is_player,
	input wire have_chess,
	output reg [224:0] disp,
	output reg [3:0] choose_row,
	output reg [3:0] choose_col,
	output reg pressed
    );
	wire [31:0] clk_div; 
	wire [3:0] whichkey;
	reg [3:0] last_key;
	
	
	clk_div
		divider(
			.clk(clk),
         .rst(rst),
         .clk_div(clk_div)
		);
		
	 ps2_input
		  myinput(
            .clk_slow(clk_div[16]),
            .clk_fast(clk_div[6]),
            .rst(rst),
            .ps2_clk(ps2_clk),
            .ps2_data(ps2_data),
            .key_up(key_up),
            .key_down(key_down),
            .key_left(key_left),
            .key_right(key_right),
            .key_ok(key_ok),
            .key_switch(key_switch),
				.whichkey(whichkey)
			);
				
	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			disp = 225'b0;
			choose_row <= 4'd7;
			choose_col <= 4'd7;
			last_key <= 4'b0;
			pressed <= 1'b0;
		end
		else if(is_player&&whichkey!=last_key) 
			case(whichkey)
				4'd1:begin
						if(choose_row>=4'd1)
							choose_row <= choose_row-4'd1;
						last_key <= whichkey;
						pressed <= 1'b0;
					end
				4'd2:begin
						if(choose_row<=4'd13)
							choose_row <= choose_row+4'd1;
						last_key <= whichkey;
						pressed <= 1'b0;
					end
				4'd3:begin
						if(choose_col>=4'd1)
							choose_col <= choose_col-4'd1;
						last_key <= whichkey;
						pressed <= 1'b0;
					end
				4'd4:begin
						if(choose_col<=4'd13)
							choose_col <= choose_col+4'd1;
						last_key <= whichkey;
						pressed <= 1'b0;
					end
				4'd5:begin
						if(!have_chess&&!disp[choose_row*15+choose_col])begin
							disp[choose_row*15+choose_col] = 1;
							pressed <= 1'b1;
						end
						last_key <= whichkey;
					end
				default: begin
					last_key <= whichkey;
					pressed <= 1'b0;
				end
			endcase	
	end
endmodule
