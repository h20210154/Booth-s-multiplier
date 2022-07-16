module adder (dout, a, b, addsub);

input [15:0]a,b;
input addsub;

output reg [15:0]dout;

always@(*)
begin
    if (addsub == 0)
    dout = a - b;

    else 
    dout = a+b;
end
    
endmodule