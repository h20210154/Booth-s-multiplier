module counter (count, decr, ldcnt, clk);

input decr,clk,ldcnt;
output reg [4:0]count;

always @(posedge clk) 
begin
    if (ldcnt)
    count <= 5'b10000;

    else if(decr)
    count <= count-1;
    
end

endmodule