module shiftreg (dout, din, s_in, clk, ld, clr, shft);

input s_in, clr, ld, shft, clk;
input [15:0]din;
output reg [15:0]dout;

always@ (posedge clk) 
begin

    if (clr)
        dout <= 0;

    else if(ld)
        dout <= din;
    
    else if (shft)
        dout <= {s_in,dout[15:1]};

    
end

endmodule