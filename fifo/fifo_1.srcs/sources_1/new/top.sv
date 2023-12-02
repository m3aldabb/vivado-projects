`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2023 02:50:00 AM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst,
    input wr, rd,
    input  [3:0] sw,
    output [3:0] led,
    output [2:0] rgb_led
    );
    
    parameter DATA_WIDTH = 4;
    parameter DEPTH = 10;
    
    logic wr_pulse, rd_pulse;
    logic full, empty;
    
    debounce debounce_wr(
        .clk(clk),
        .rst(rst),
        .din(wr),
        .dout(wr_pulse)
    );
    
    debounce debounce_rd(
        .clk(clk),
        .rst(rst),
        .din(rd),
        .dout(rd_pulse)
    );
    
    fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .DEPTH(DEPTH)
    ) fifo_0 (
        .clk(clk),
        .rst(rst),
        .wr(wr_pulse),
        .rd(rd_pulse),
        .data_in(sw),
        .data_out(led),
        .full(full),
        .empty(empty)
    );
    
    assign rgb_led[0] = full;
    assign rgb_led[1] = empty;
    assign rgb_led[2] = ~full & ~empty;
    
endmodule
