module DATA_PATH (loadA, loadQ, loadM, clrA, clrQ, clrff, shftA, shftQ, addsub, decr, ldcnt, data_in, clk, qm1, eqz, Q[0]);

    input loadA, loadQ, loadM, clrA, clrQ, clrff, shftA, shftQ, addsub, clk, ldcnt, decr;
    input [15:0]data_in;
    output qm1,eqz;
    output [15:0]Q;
    
    wire [15:0]A,M,Z;

    wire [4:0]count;

    assign eqz = ~|count;

    shiftreg AR(A, Z, A[15], clk, loadA, clrA, shftA);
    shiftreg QR (Q, data_in, A[0], clk, loadQ, clrQ, shftQ);
    dff QM1(qm1, Q[0], clk, clrff);
    pipo MR (M, data_in, clk, loadM);
    adder AS (Z, A, M, addsub);
    counter CN (count, decr, ldcnt, clk);

endmodule