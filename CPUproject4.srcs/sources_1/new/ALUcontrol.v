`timescale 1ns / 1ps
module ALUcontrol (A_control, Fcode, ALUopcode, reset);

input reset;
input [3:0] ALUopcode;
input  [2:0] Fcode;
output reg [2:0] A_control; 

always @ (*)
begin 
if (reset == 1)
       A_control <= 3'b000;
   else if (ALUopcode == 4'b1000);
begin
       case (Fcode)
       
        3'b000:   A_control <= 3'b100;
        3'b001:  A_control <= 3'b101;
        3'b010:    A_control <= 3'b001;
        3'b011:    A_control <= 3'b110;
        3'b100:   A_control <= 3'b010;
        3'b111:    A_control <= 3'b111;
        3'b110:    A_control <= 3'b011;
        default:    A_control <= 3'b000;
     endcase
  end
    
     case(ALUopcode) 
      4'b0100:  A_control <= 3'b101;    //beq instruction
       4'b0001:  A_control <= 3'b100;  // lw/sw instruction
        4'b0011: A_control <= 3'b101;   // bne instrucion
         4'b1001: A_control <= 3'b100;  // addimmediate
          4'b1010: A_control <= 3'b101;   //subtract immediate
           4'b1011: A_control <= 3'b001;  //and immeidate
            4'b1100: A_control <= 3'b110;   // or immediate
             4'b1101: A_control <= 3'b010;    //slt immeidate
              4'b1110: A_control <= 3'b111;  //sgt immediate
               default: A_control <= 3'b000;
     endcase
 end   
  endmodule    
