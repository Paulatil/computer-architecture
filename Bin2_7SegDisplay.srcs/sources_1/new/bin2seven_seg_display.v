`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module bin2seven_seg_display(clk, reset, Outvalue, anode_activate, cathode_select);

input clk, reset;
input [15:0] Outvalue;
output reg [3:0] anode_activate;
output reg [6:0] cathode_select;
reg [3:0] BCD_out;
reg [9:0] refresh_counter;
wire [1:0] LED_activating_counter;

always @(posedge clk)
begin
 if (reset == 1)
  refresh_counter <= 0;
  else if (refresh_counter <= 10'b1111111110 )
   refresh_counter <= refresh_counter + 1;
    else
     refresh_counter <= 0;
  end
  assign LED_activating_counter = refresh_counter[9:8];
  
  always @ (*)
  begin
   case (LED_activating_counter)
   2'b00 : begin
           anode_activate <= 4'b1110;
           BCD_out <= Outvalue[3:0];
          end
           
   2'b01 : begin
           anode_activate <= 4'b1101;
           BCD_out <= Outvalue[7:4];         
         end
    
    2'b10 : begin
           anode_activate <= 4'b1011;
           BCD_out <= Outvalue[11:8];         
         end     
         
   2'b11 : begin
           anode_activate <= 4'b0111;
           BCD_out <= Outvalue[15:12];         
         end 
         
 default : begin
           anode_activate <= 4'b1111;
          end
   endcase
 end
 
 always @ (*)
 begin
 
  case (BCD_out)
   4'b0000 : cathode_select <= 7'b0000001;
   4'b0001 : cathode_select <= 7'b1001111;
   4'b0010 : cathode_select <= 7'b0010010;
   4'b0011 : cathode_select <= 7'b0000110;
   4'b0100 : cathode_select <= 7'b1001100;
   4'b0101 : cathode_select <= 7'b0100100;
   4'b0110 : cathode_select <= 7'b0100000;
   4'b0111 : cathode_select <= 7'b0001111;
   4'b1000 : cathode_select <= 7'b0000000;
   4'b1001 : cathode_select <= 7'b0000100;
   4'b1010 : cathode_select <= 7'b0000010;
   4'b1011 : cathode_select <= 7'b1100000;
   4'b1100 : cathode_select <= 7'b0110001;
   4'b1101 : cathode_select <= 7'b1000011;
   4'b1110 : cathode_select <= 7'b0010000;
   4'b1111 : cathode_select <= 7'b0111000;
   default : cathode_select <= 7'b1111111;
  endcase
 end
                
endmodule
