`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2023 10:42:06
// Design Name: 
// Module Name: Lab1_FSM
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


module vendM (
    input fifty, dollar, cancel, clk, rst,
    output reg insert_coin, dispense, money_return,
    output reg [1:0] st
);

parameter INIT = 2'b00, S50 = 2'b01, VEND = 2'b10, RETURN = 2'b11;
reg [1:0] nst;
//assign out = (st == RETURN);

always @ (posedge clk)
begin
    if(rst) //  !rst?
        st <= INIT;
    else
        st <= nst;
end

always @ *
begin
    nst = st;
    insert_coin = 1'b1; // Do I need these?
    dispense = 1'b0;
    money_return = 1'b0;

    case(st)
        INIT: begin 
                if(fifty)
                    nst = S50;

               if(dollar)
                    nst = VEND;
               end
        S50: begin
                insert_coin = 1'b1;
                
                if(fifty)
                    nst = VEND;
            
                if(dollar)
                    nst = RETURN;
                
                if(cancel)
                    nst = RETURN;
                    
               end
        
        VEND: begin
            insert_coin = 1'b0; 
            dispense = 1'b1;
            end

        RETURN: begin
                nst = INIT;
                insert_coin = 1'b0;
                money_return = 1'b1;            
            end
    endcase 


end
    
endmodule
