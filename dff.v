module dff(q,d,clk,clr);

    input d,clk,clr;
    output reg q;

    always @ (posedge clk)
    begin
        if (clr)
            q <= 0;
        
        else 
            q<=d;
    end

endmodule