module pipo (dout, din, clk, load);

    input clk, load;
    input [15:0]din;
    output reg [15:0]dout;

    always@ (posedge clk)
    begin
        
        if (load)

        dout <= din;
    end
endmodule