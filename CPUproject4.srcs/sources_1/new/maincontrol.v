`timescale 1ns /1ps

module controller (opcode, RegWSrc, jc, bc, RegWrite, ALUopcode, Mem2Reg, RegImm, memR, memW, reset, zeroflag);

input [3:0] opcode;
input reset, zeroflag;
output reg [3:0] ALUopcode;
output reg  jc, bc, RegWSrc, Mem2Reg, RegImm, memR, memW, RegWrite;


 always@ (*)
 begin
        if (reset)
       begin 
          ALUopcode <= 4'b0000;
          jc <= 0;
          bc <= 0;
          RegWSrc <= 0;
          Mem2Reg <= 0;
          RegImm <= 0;
          memR <= 0;
          memW <= 0;
          RegWrite <= 0;
     end     
        else
    begin
     
     case (opcode)
     
       4'b0000: begin  ALUopcode = 4'b1000;     // R-type instructios
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 1;
                   Mem2Reg <= 1;
                   RegImm <= 1;
                   memR <= 0;
                   memW <= 0;
                   RegWrite <= 1;
         end
      4'b0001: begin     ALUopcode <= 4'b1001;   // add immediate
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 0;
                   Mem2Reg <= 1;
                   RegImm <= 0;
                   memR <= 0;
                   memW <= 0;
                   RegWrite <= 1;          
          end         
       4'b0010: begin   ALUopcode <= 4'b1010;  // subtract immediate
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 0;
                   Mem2Reg <= 1;
                   RegImm <= 0;
                   memR <= 0;
                   memW <= 0;
                  RegWrite <= 1;          
           end        
        4'b0011: begin   ALUopcode <= 4'b0001;   //lw instricution
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 0;
                   Mem2Reg <= 0;
                   RegImm <= 0;
                   memR <= 1;
                   memW <= 0;
                   RegWrite <= 1; 
            end       
       4'b0100: begin  ALUopcode <= 4'b0001;   //sw instruction
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 1;
                   Mem2Reg <= 1;
                   RegImm <= 0;
                   memR <= 0;
                   memW <= 1;
                  RegWrite <= 0; 
              end     
        4'b0101: begin  ALUopcode <= 4'b0011;  //bne instruction
                   jc <= 0;
                   RegWSrc <= 1;
                   Mem2Reg <= 1;
                   RegImm <= 1;
                   memR <= 0;
                   memW <= 0;
                  RegWrite <= 0;
               if (zeroflag == 0)
                  bc <= 1;       
            end       
        4'b0110: begin   ALUopcode <= 4'b0100;  //beq 
                   jc <= 0;
                   RegWSrc <= 1;
                   Mem2Reg <= 1;
                   RegImm <= 1;
                   memR <= 0;
                   memW <= 0;
                  RegWrite <= 0; 
               if (zeroflag == 0)
                   bc <= 1;   
             end      
        4'b0111: begin  ALUopcode <= 4'b1011;  //and immediate
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 0;
                   Mem2Reg <= 1;
                   RegImm <= 0;
                   memR <= 0;
                   memW <= 0;
                  RegWrite <= 1; 
             end      
       4'b1000: begin    ALUopcode <= 4'b1100;   //or immediate
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 0;
                   Mem2Reg <= 1;
                   RegImm <= 0;
                   memR <= 0;
                   memW <= 0;
                  RegWrite <= 1; 
         end          
       4'b1001: begin   ALUopcode <= 4'b1101;  //slt immediate
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 1;
                   Mem2Reg <= 1;
                   RegImm <= 1;
                   memR <= 0;
                   memW <= 0;
                  RegWrite <= 1;
            end       
     4'b1010:  begin    ALUopcode <= 4'b1110;   //sgt immediate
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 1;
                   Mem2Reg <= 1;
                   RegImm <= 1;
                   memR <= 0;
                   memW <= 0;
                 RegWrite <= 1;
            end       
     4'b1100:  begin    ALUopcode <= 4'b0000;  //jump
                   jc <= 1;
                   bc <= 0;
                   RegWSrc <= 0;
                   Mem2Reg <= 0;
                   RegImm <= 0;
                   memR <= 0;
                   memW <= 0;
                  RegWrite <= 0;
           end        
      4'b1101: begin     ALUopcode <= 4'b0000; //jump and link (jal)
                   jc <= 1;
                   bc <= 0;
                   RegWSrc <= 0;
                   Mem2Reg <= 0;
                   RegImm <= 0;
                   memR <= 0;
                   memW <= 0;
                  RegWrite <= 0;
             end      
     4'b1111:   begin  ALUopcode <= 4'b0000;   // halt instruction
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 0;
                   Mem2Reg <= 0;
                   RegImm <= 0;
                   memR <= 0;
                   memW <= 0;
                  RegWrite <= 0;
                end   
       default:   begin  ALUopcode <= 4'b0000;   // default
                   jc <= 0;
                   bc <= 0;
                   RegWSrc <= 0;
                   Mem2Reg <= 0;
                   RegImm <= 0;
                   memR <= 0;
                   memW <= 0;
                  RegWrite <= 0;
                end   
         endcase
      end            
  end
 endmodule  
