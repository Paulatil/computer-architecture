 `timescale 1ns / 1ps
 module PC (PC_in, PC_out, reset, clk);

input [15:0] PC_in;
input clk, reset;
output reg [15:0] PC_out;


initial
begin
 PC_out <= 16'b0000000000000000;
end

always @ (posedge clk) 
 begin
     if(reset == 1)
      PC_out <= 0;
      else
       PC_out <= PC_in;
  end     
endmodule
