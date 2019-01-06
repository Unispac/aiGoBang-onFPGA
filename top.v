`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:17:26 12/27/2018 
// Design Name: 
// Module Name:    top 
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
module top(

    input wire clk,         // Clock (100MHz)
    input wire rst,         // Reset button, 0 = pressed, 1 = released
    input wire ps2_clk,     // PS2 clock
    input wire ps2_data,    // PS2 data
    output wire sync_h,     // VGA horizontal sync
    output wire sync_v,     // VGA vertical sync
    output wire [3:0] r,    // VGA red component
    output wire [3:0] g,    // VGA green component
    output wire [3:0] b   // VGA blue component
	  
	 //for test 
	 //output wire seg_clk,
	 //output wire seg_sout,
	 //output wire SEG_PEN,
	 //output wire seg_clrn
    );
    
    wire [31:0] clk_div;
	 wire [224:0] display_black,display_white,disp;
	 wire [3:0] choose_row,choose_col,choose_row1,choose_col1,choose_row2,choose_col2;
	 reg is_player;
	 reg [1:0] who_win;
	 wire pressed,pressed1,pressed2;
	 wire have_chess_white,have_chess_black;
	 
	 assign have_chess_white = display_white[choose_row*15+choose_col];
	 assign have_chess_black = display_black[choose_row*15+choose_col];
	 assign choose_row = (is_player) ? choose_row1 : choose_row2;
    assign choose_col = (is_player) ? choose_col1 : choose_col2;
	 assign disp = (is_player) ? display_black : display_white;
	 assign pressed = (is_player) ? pressed1 : pressed2;
	 
    disp_chess_board
        display(
            .clk(clk_div[1]),
            .rst(rst),
				.display_black(display_black),
				.display_white(display_white),
				.choose_row(choose_row), 
				.choose_col(choose_col), 
				.who_win(who_win),
            .sync_h(sync_h),
            .sync_v(sync_v),
            .r(r),
            .g(g),
            .b(b)
        );
    
  
    clk_div
        divider(
            .clk(clk),
            .rst(rst),
            .clk_div(clk_div)
        );
	
	 /*player player1 (
			  .clk(clk), 
			  .rst(rst), 
			  .ps2_clk(ps2_clk), 
			  .ps2_data(ps2_data), 
			  .is_player(is_player), 
			  .have_chess(have_chess_white), 
			  .disp(display_black), 
			  .choose_row(choose_row1), 
			  .choose_col(choose_col1), 
			  .pressed(pressed1)
		  );*/
		  
	aiGo ai1 (
		 .reset(rst),
		 .clk(clk_div[12]), 
		 .humanIn(display_white), 
		 .enable(is_player), 
		 .AIOut(display_black), 
		 .finish(pressed1),
		 .x(choose_row1),
		 .y(choose_col1)
    );
	 
	 player player2 (
		     .clk(clk), 
		     .rst(rst), 
		     .ps2_clk(ps2_clk), 
		     .ps2_data(ps2_data), 
		     .is_player(~is_player), 
		     .have_chess(have_chess_black), 
		     .disp(display_white), 
		     .choose_row(choose_row2), 
		     .choose_col(choose_col2), 
		     .pressed(pressed2)
		  );

	 win_checker check1 (
			  .row(choose_row1), 
			  .col(choose_col1), 
			  .ch(display_black), 
			  .win_check(win_check1)
        );
	
	 win_checker check2 (
			  .row(choose_row2), 
			  .col(choose_col2), 
			  .ch(display_white), 
			  .win_check(win_check2)
        );	
		
	always@(posedge clk or negedge rst)
		if(!rst)
			who_win <= 2'b0;
		else 
			if(win_check1)
				who_win <= 1;
			else if(win_check2)
				who_win <= 2;		
	
	always@(posedge pressed or negedge rst)
		if(!rst) 
			is_player <= 1'b1;
		else 
			is_player <= ~is_player;

	//LED输出对应功能键的数字
	//SSeg7_Dev m4(.clk(clk),.rst(1'b0),.Start(clk_div[20]),.SW0(1'b1),.flash(1'b0),.Hexs({28'h0_00_00_00,whichkey[3],whichkey[2],whichkey[1],whichkey[0]}),
	//.point(8'b1111_1111),.LES(8'b1111_1111),.seg_clk(seg_clk),.seg_sout(seg_sout),.SEG_PEN(SEG_PEN),.seg_clrn(seg_clrn));
	
		
endmodule

