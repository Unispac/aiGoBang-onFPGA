`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:54:58 12/27/2018 
// Design Name: 
// Module Name:    disp_chess_board 
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
module disp_chess_board(
    input wire clk,                     // Clock (25MHz)
    input wire rst,                     // Reset
	 input wire data_ram_we,
	 input wire [224:0] display_black,
	 input wire [224:0] display_white,
	 input wire [3:0] choose_row,
	 input wire [3:0] choose_col,
	 input wire [1:0] who_win,
    output wire sync_h,                 // VGA horizontal sync
    output wire sync_v,                 // VGA vertical sync
    output wire [3:0] r,                // VGA red component
    output wire [3:0] g,                // VGA green component
    output wire [3:0] b,                 // VGA blue component
	 output wire [11:0] douta
    );
	 
	
	  // Side parameters

					
    localparam GRID_X_BEGIN = 80,
               GRID_X_END = 559,
               GRID_Y_BEGIN = 0,
               GRID_Y_END = 479,
					GRID_SIZE = 31,
					SIDE_X_BEGIN = 102,
					SIDE_X_END = 536,
					SIDE_Y_BEGIN = 23,
					SIDE_Y_END = 457;
					
	 
					
	 
	 
	 //current display color: in the display area and out of the area
	 
	 reg [11:0] rgb;
	 reg [17:0] ram_addr;
	 reg [3:0] row,col;
 	 //reg [11:0] douta;
	 
    assign r = video_on ? rgb[11:8] : 4'b0;
    assign g = video_on ? rgb[7:4]  : 4'b0;
    assign b = video_on ? rgb[3:0]  : 4'b0;
	 assign data_ram_we = 1'b0;
	 
	 initial begin ram_addr = 18'b0;
	 end

 // VGA control signal generator
    wire video_on;
    wire [9:0] x, y;
    vga_sync
        sync(
            .clk(clk),
            .rst(rst),
            .sync_h(sync_h),
            .sync_v(sync_v),
            .video_on(video_on),
            .x(x),
            .y(y)
        );
		  
	
	rom_cb U3 (
		.clka(clk), 	  // input clka
		.wea(data_ram_we),  // input [0 : 0] wea
		.addra(ram_addr),      // input [17 : 0] addra
		.dina(12'b0),   // input [11:0] dina
		.douta(douta)// output [11:0] douta
   );
	
	chess_piece U4(
		.clk(clk),
		.x(x),
		.y(y),
		.col(col),
		.row(row),
		.judge(judge)
	);
	
	always@(x or y)begin
		if(y >= SIDE_Y_BEGIN-GRID_SIZE/2&&y <= SIDE_Y_BEGIN+GRID_SIZE/2)
			row = 4'b0000;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*3/2)
			row = 4'b0001;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*3/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*5/2)
			row = 4'b0010;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*5/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*7/2)
			row = 4'b0011;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*7/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*9/2)
			row = 4'b0100;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*9/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*11/2)
			row = 4'b0101;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*11/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*13/2)
			row = 4'b0110;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*13/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*15/2)
			row = 4'b0111;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*15/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*17/2)
			row = 4'b1000;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*17/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*19/2)
			row = 4'b1001;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*19/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*21/2)
			row = 4'b1010;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*21/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*23/2)
			row = 4'b1011;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*23/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*25/2)
			row = 4'b1100;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*25/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*27/2)
			row = 4'b1101;
		else if(y >= SIDE_Y_BEGIN+GRID_SIZE*27/2&&y <= SIDE_Y_BEGIN+GRID_SIZE*29/2)
			row = 4'b1110;
		else row = 4'b1111;
		
		if(x >= SIDE_X_BEGIN-GRID_SIZE/2&&x <= SIDE_X_BEGIN+GRID_SIZE/2)
			col = 4'b0000;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE/2&&x <= SIDE_X_BEGIN+GRID_SIZE*3/2)
			col = 4'b0001;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*3/2&&x <= SIDE_X_BEGIN+GRID_SIZE*5/2)
			col = 4'b0010;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*5/2&&x <= SIDE_X_BEGIN+GRID_SIZE*7/2)
			col = 4'b0011;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*7/2&&x <= SIDE_X_BEGIN+GRID_SIZE*9/2)
			col = 4'b0100;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*9/2&&x <= SIDE_X_BEGIN+GRID_SIZE*11/2)
			col = 4'b0101;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*11/2&&x <= SIDE_X_BEGIN+GRID_SIZE*13/2)
			col = 4'b0110;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*13/2&&x <= SIDE_X_BEGIN+GRID_SIZE*15/2)
			col = 4'b0111;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*15/2&&x <= SIDE_X_BEGIN+GRID_SIZE*17/2)
			col = 4'b1000;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*17/2&&x <= SIDE_X_BEGIN+GRID_SIZE*19/2)
			col = 4'b1001;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*19/2&&x <= SIDE_X_BEGIN+GRID_SIZE*21/2)
			col = 4'b1010;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*21/2&&x <= SIDE_X_BEGIN+GRID_SIZE*23/2)
			col = 4'b1011;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*23/2&&x <= SIDE_X_BEGIN+GRID_SIZE*25/2)
			col = 4'b1100;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*25/2&&x <= SIDE_X_BEGIN+GRID_SIZE*27/2)
			col = 4'b1101;
		else if(x >= SIDE_X_BEGIN+GRID_SIZE*27/2&&x <= SIDE_X_BEGIN+GRID_SIZE*29/2)
			col = 4'b1110;
		else col = 4'b1111;
	end
	//get rgb information in ram
	always @ (posedge clk) begin
        if (x >= GRID_X_BEGIN && x <= GRID_X_END &&
            y >= GRID_Y_BEGIN && y <= GRID_Y_END) begin
            // Draw the chessboard
				if(who_win==2'd1)
					rgb <= 12'h0f0;
				else if(who_win==2'd2)
					rgb <= 12'h00f;
				else if(display_black[row*15+col]&&judge&&row!=4'b1111&&col!=4'b1111)
					rgb <= 12'h000;
				else if(display_white[row*15+col]&&judge&&row!=4'b1111&&col!=4'b1111)
					rgb <= 12'hfff;
				else if(row==choose_row&&col==choose_col&&row!=4'b1111&&col!=4'b1111&&
						(x-SIDE_X_BEGIN-col*GRID_SIZE==GRID_SIZE/2||x-col*GRID_SIZE+GRID_SIZE/2==SIDE_X_BEGIN
						||y-SIDE_Y_BEGIN-row*GRID_SIZE==GRID_SIZE/2||y-row*GRID_SIZE+GRID_SIZE/2==SIDE_Y_BEGIN))
					rgb <= 12'hf00;
				else begin
					ram_addr = y*480+(x-80) ;
					rgb <= douta; 
				end
		  end
		else  rgb <= 12'hfff;
	end
	 
endmodule
