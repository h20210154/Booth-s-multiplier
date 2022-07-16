module booth_tb();

reg [15:0]data_in;
reg clk,start;

DATA_PATH D1 (loadA, loadQ, loadM, clrA, clrQ, clrff, shftA, shftQ, addsub, decr, ldcnt, data_in, clk, qm1, eqz, q0);
fsm f1 (state, loadA,clrA,shftA,loadQ,clrQ,shftQ,loadM,clrff,addsub,decr,ldcnt,done,clk,q0,qm1,start,eqz);

initial begin
    clk=1'b0;
    #3 start = 1'b1;
    #1000 $finish;
end

always #5 clk = ~clk;

initial begin
    #13 data_in=13;
    #22 data_in = -10;

end

initial begin
   // $monitor($time, "%d %b ", DP.Aout, done);
    $dumpfile("booth.vcd"); $dumpvars(0, booth_tb);
end

endmodule