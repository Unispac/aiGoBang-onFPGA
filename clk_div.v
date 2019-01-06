`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:11:56 12/27/2018 
// Design Name: 
// Module Name:    clk_div 
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
module clk_div(
    input wire clk,              // Clock
    input wire rst,              // Reset
    output reg [31:0] clk_div    // Division result
    );
    
    always @ (posedge clk or negedge rst)
        if (!rst)
            clk_div <= 32'b0;
        else
            clk_div <= clk_div + 1;
    
endmodule
