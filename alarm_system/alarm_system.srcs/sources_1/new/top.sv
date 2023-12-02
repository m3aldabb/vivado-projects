`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/23/2023 04:43:26 PM
// Design Name: 
// Module Name: hw_top
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


module hw_top(
    input   clk,
    input   rst,
    input   [3:0]   din,
    output  [2:0]   status,
    output  [3:0]   chars
    );
    
    logic   [3:0]   din_pulse;
    
    generate
        for(genvar i = 0; i < 4; i++) begin
            debounce debounce_0 (
                .clk(clk),
                .rst(rst),
                .din(din[i]),
                .dout(din_pulse[i])
            );
        end
    endgenerate 
        
    alarm_system alarm_system_0 (
        .clk(clk),
        .rst(rst),
        .din(din_pulse),
        .status(status),
        .chars(chars)
    );
endmodule
