`timescale 1ns /1ps

module signextend (immediate, extended);

input [5:0] immediate;
output [15:0] extended;

 assign extended = {{10{immediate[5]}},immediate[5:0]};
 
endmodule