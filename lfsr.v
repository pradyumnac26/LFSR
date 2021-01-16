
module lfsr(clk);
input clk;
reg q3,q2,q1,q0;
reg [4:0] count;
reg [3:0] disp;
initial begin
 q0=4'b1;
 q1=4'b0;
 q2=4'b0;
 q3=4'b0;
 
   count = 4'b0;
   end
    always @(posedge clk)
    begin
        q3<=q0;
        q2<=q3;
        q1<=q2;
        q0<=q1^q0;
 
       
    end
    
    always @(posedge clk)
        begin
         disp = {q3,q2,q1,q0}; 
         count = count+ 4'b1;
       // $display (Q0,Q1,Q2,Q3);
        if(count==15)
             $finish;
        if(disp==4'b0011)
        begin
           disp = 4'b000;
           $display("%b",disp);
           end
        else
           $display("%b",disp);
    end
endmodule
