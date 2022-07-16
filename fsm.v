module fsm(state, loadA,clrA,shftA,loadQ,clrQ,shftQ,loadM,clrff,addsub,decr,ldcnt,done,clk,q0,qm1,start,eqz);

    input clk,q0,qm1,start,eqz;
    output reg loadA,clrA,shftA,loadQ,clrQ,shftQ,loadM,clrff,addsub,decr,ldcnt,done;

    output reg [2:0]state;

    parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101, S6=3'b110;

    always @(posedge clk)
    begin
         case (state)

            S0: if(start) state<=S1;
            S1: state <= S2;
            S2: if ({q0,qm1} == 2'b01) state <= S3;
                else if({q0,qm1} == 2'b10) state <= S4;
                else state <= S5;
            S3: state <= S5;
            S4: state <= S6;
            S5: #2 if(({q0,qm1} == 2'b01) && !eqz) state <= S3;
                    else if (({q0,qm1} == 2'b10) && !eqz) state <= S4;
                    else if (eqz) state <= S6;
            S6: state <= S6;

            default: state <= S0;


         endcase
    end

always@(state)
begin
    case (state)

        S0: begin clrA=0; loadA=0; shftA=0; clrQ=0; loadQ=0; shftQ=0; loadM=0; clrff=0; done=0; addsub=0; end
        S1: begin clrA=1; clrff=1; loadM=1; ldcnt=1; end
        S2: begin clrA=0; loadM=0;  clrff=0; loadQ = 1; end
        S3: begin loadQ=0; loadA=1; addsub=1; shftA=0; shftQ=0; decr=0; end
        S4: begin loadQ=0; loadA=1; addsub=0; shftA=0; shftQ=0; decr=0;   end
        S5: begin shftA=1; shftQ=1; loadA=0; loadQ=0; decr=1; end
        S6: begin done =1;   end
        default: begin  clrA=0; shftA=0; loadQ=0; shftQ=0;   end
    endcase
end




endmodule