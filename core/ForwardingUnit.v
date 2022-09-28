`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/09/22 13:55:29
// Design Name: 
// Module Name: ForwardingUnit
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


module ForwardingUnit(
    input clk,
    
    input [4:0] rs1_ID,
    input [4:0] rs2_ID,
    
    input [4:0] rd_EX,
    input [4:0] rd_MEM,
    
    input RegWrite_EX, 
    input RegWrite_MEM,
    
    output [1:0]FWA,
    output [1:0]FWB,
    output FWM
    
    );
    
    wire EX_hazard_A = RegWrite_EX & !(&rd_EX) & (rs1_ID == rd_EX);
    wire MEM_hazard_A = RegWrite_MEM & !(&rd_MEM) & ! EX_hazard_A & (rs1_ID == rd_MEM);
    
    
    
    
    wire EX_hazard_B = RegWrite_EX & !(&rd_EX) & (rs2_ID == rd_EX);
    wire MEM_hazard_B = RegWrite_MEM & !(&rd_MEM) & ! EX_hazard_B & (rs2_ID == rd_MEM);
    
    
    assign FWA =  ({2{EX_hazard_A}} & 2'b01)  |  ({2{MEM_hazard_A}} & 2'b11)  | ({2{!EX_hazard_A & !MEM_hazard_A}} & 2'b00) ;
                                
    assign FWB =  ({2{EX_hazard_B}} & 2'b01)  |  ({2{MEM_hazard_B}} & 2'b11)  | ({2{!EX_hazard_B & !MEM_hazard_B}} & 2'b00) ;
    
    
    
    
    
    always @(posedge clk ) begin
    
    end      
    
    
    
endmodule
