`timescale 1ns / 1ps
module ALU (I1, I2, A_control, zeroflag, out1);

 input [15:0] I1,I2;
 input [2:0] A_control;
 output reg [15:0] out1;
 output reg zeroflag;
 
 always @ (*)
  begin
 
 case (A_control)
 
     3'b100:  out1 <= I1 + I2;
     
     3'b101:  out1 <= I1 - I2;
          
     3'b010: out1 <= I1 < I2 ? 1 : 0;
                   
      3'b111: out1 <= I1 > I2 ? 1 : 0;
     
     3'b001:  out1 <=  I1 & I2;
     
     3'b110:  out1 <= I1 | I2;
     
     3'b011: out1 <= ~(I1 | I2);
     
 endcase
    if (out1 -- 0)
     zeroflag <= 1;
     else
      zeroflag <= 0;
      
 end    
endmodule
