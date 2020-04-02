`timescale 1ns /1ps
module ADD (addin1, addin2, add_out);

 input [15:0] addin1, addin2;
 output [15:0] add_out;

   assign  add_out = addin1 + addin2;
 
 endmodule   