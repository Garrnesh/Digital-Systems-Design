module vendingMachine (
    input fifty, dollar, cancel, clk, rst
    output insert, dispense, return;
    output out; //Should it be the state instead?
);

parameter INIT = 2'b00, S50 = 2'b01, VEND = 2'b10, RETURN = 2'b11;
reg [1:0] nst, st;
assign out = (st == ret);

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
    insert = 1'b0; // Do I need these?
    dispense = 1'b0;
    return = 1'b0;

    case(st)
        INIT: if(fifty)
                    nst = S50;

                if(dollar)
                    nst = VEND;

        S50: 
                insert = 1'b1;
                
                if(fifty)
                    nst = VEND;
            
                if(dollar)
                    nst = RETURN;
                
                if(cancel)
                    nst = RETURN;
        
        VEND: dispense = 1'b1;

        RETURN: 
            nst = INIT;
            return = 2'b1;

    endcase 


end
    
endmodule