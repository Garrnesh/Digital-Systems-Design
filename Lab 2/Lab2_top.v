`timescale 1ns / 1ps

module Lab2_top (input clk, rst, write_en, save_data, show_reg,
                 input [7:0] d_in,
                 output [7:0] d_out
                );
    
reg [7:0] reg_d;
reg [7:0] mem_d;


always @(posedge clk)
    begin
        if(rst)
            reg_d <= 8b00000000;

        if(save_data)
            reg_d <= d_in;
            
    end

assign d_out = show_reg ? mem_d : reg_d;


endmodule