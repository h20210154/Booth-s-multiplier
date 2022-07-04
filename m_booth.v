//`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module m_booth(M, Q, Z);

output [11:0]Z;
input [5:0]M,Q;
reg [5:0]A=0;
reg Q_1=0;
integer i;
reg [5:0]M_temp, Q_temp;

assign M_temp = M;
assign Q_temp = Q;  
//assign A = 6'b000000;

//always@(*)
//begin
       // A = 6'b000000;
       // Q_1=0;
//end

always@ (Q or Q_1)
begin
        for (i=3;i>0;i=i-1)
        
        if (Q_1==0)
        begin
        case(Q[1:0])
                
                2'b00 :  begin 
                            Q_temp = {A[0],A[1],Q[5:2]};
                         end
                2'b01  : begin
                            
                            A = A+M;
                            Q_1 = Q[1];
                            Q_temp = {A[0],A[1],Q[5:2]};
                            A = {A[5],A[5],A[3:0]};
                            
                           end
                 2'b10   : begin
                
                            M_temp = {M[4:0],0};
                            M_temp = ~M+1;
                            A = A+M;
                            Q_1 = Q[1];
                            Q_temp = {A[0],A[1],Q[5:2]};
                            A = {A[5],A[5],A[3:0]};
                            
                            end
                  
                  2'b11  : begin
                             
                             M_temp = ~M+1;
                             A = A+M;  
                             Q_1 = Q[1];
                             Q_temp = {A[0],A[1],Q[5:2]};
                             A = {A[5],A[5],A[3:0]};
                            
                            end
        
        endcase   
        end 
                       
        if (Q_1==1)
        begin
        case(Q[1:0])  
        
                2'b00  : begin
                            
                            A = A+M;
                            Q_1 = Q[1];
                            Q_temp = {A[0],A[1],Q[5:2]};
                            A = {A[5],A[5],A[3:0]};
                            
                          end 
            
                2'b01  : begin
                            
                             M_temp = {M[4:0],0};
                             A = A+M;
                             Q_1 = Q[1];
                             Q_temp = {A[0],A[1],Q[5:2]};
                             A = {A[5],A[5],A[3:0]};       
                  
                          end
                      
                2'b10  : begin
                             
                             M_temp = ~M+1;
                             A = A+M;  
                             Q_1 = Q[1];
                             Q_temp = {A[0],A[1],Q[5:2]};
                             A = {A[5],A[5],A[3:0]};
                            
                          end         
                            
                2'b11  : begin
                            
                             Q_temp = {A[0],A[1],Q[5:2]};
                             
                          end 
                          
        endcase
        end  
end                                    
 
   assign Z[11:0] = {A[5:0],Q_temp[5:0]};                                 
   
endmodule
