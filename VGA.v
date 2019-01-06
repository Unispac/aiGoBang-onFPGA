`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:38:56 11/26/2018 
// Design Name: 
// Module Name:    VGA 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: vgaÇý¶¯£¬ÐÐÉ¨Ãè£¬Ö¡É¨Ãè£¬ÏñËØÍ¬²½
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
//vga control 800*600 60Hz 
module VGA(input clk;//clk = 25MHz
	input rst;
	input [11:0]Din,
	
	output reg [8:0]row,
	output reg [9:0]col,
	output reg rdn,
	output reg [3:0]R,G,B,
	output reg HS,VS
    );
	//h_count: VGA horizontal counter (0-799)
	reg [9:0] h_count;// scan in a line  VGA horizontal counter (0-799) : pixels
		always @ (posedge clk) begin
			if (rst) h_count <= 10'h0;
			else if (h_count == 10'd799)
						h_count <= 10'h0;
					else h_count <= h_count + 10'h1
		end
	//v_count: VGA vertical counter (0-524)
	reg [9:0] v_count; // scan lines in column VGA vertical counter (0-524): lines	
		always @ (posedge clk or posedge rst) begin
			if (rst) v_count <= 10'h0;
			else if (h_count == 10'd799) begin
					if(v_count == 10'd524) v_count <= 10'h0;
					else v_count <= v_count + 10;h1;
			end
		end
	//signals, will be latched for outputs
	wire [9:0] row_addr = v_count - 10'd35; //pixel ram row addr
	wire [9:0] col_addr = h_count - 10'd143; //pixel ram col addr
	wire			h_sync = (h_count > 10'd95);
	wire			v_sync = (v_count > 10'd1);
	wire			  read = (h_count > 10'd142) &&
							(h_count < 10'd783) &&
							(v_count > 10'd34)  &&
							(v_count < 10'd515);
	//vga signals
	always @ (posedge clk) begin
		row <= row_addr[8:0];
		col <= col_addr;
		rdn <= ~read;
		HS  <= h_sync;
		VS  <= v_sync;
		R   <= rdn ? 4'h0 :Din[3:0];
		G   <= rdn ? 4'h0 :Din[7:4];
		B   <= rdn ? 4'h0 :Din[11:8];
	end
endmodule
