`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2018 10:43:09
// Design Name: 
// Module Name: PIN_TEST
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PIN_TEST(
input clk,
output reg pin
    );
    
always @(posedge clk)
    begin
        pin <= 1'b1;
    end
endmodule
