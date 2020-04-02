`timescale 1ns / 1ps
module Registers (data1, data2, Sreg1, Sreg2, Dreg, data_in, clk, reset, regWrite, Outvalue, inR);

input regWrite,clk, reset;
input [15:0] data_in;
input [2:0] Sreg1, Sreg2, Dreg, inR;
reg [15:0] Regarray[0:7];
output  [15:0] data1, data2, Outvalue;
integer j;

     assign data1 = Regarray[Sreg1];
     assign data2 = Regarray[Sreg2];
      assign Outvalue = Regarray[inR];
initial 
begin
Regarray[0] <= 16'b0000000000000000;
Regarray[4] <= 16'b0000000000100000;
Regarray[5] <= 16'b0000000000110000;
Regarray[6] <= 16'b0000000000000000;
end

 always @ (posedge clk) 
 begin
     if (reset) begin
      for(j = 0; j < 8; j = j+1) begin
           Regarray[j] <= 16'b0000000000000000;
         end
       end  
      
      if (regWrite == 1)
        Regarray[Dreg] <= data_in;
        
      end
      
   endmodule     
