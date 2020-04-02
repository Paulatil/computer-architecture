`timescale 1ns /1ps
module MUX (sel, mux1, mux2, mux_out);

input [15:0] mux1, mux2;
input sel;
output  [15:0] mux_out;

    assign mux_out = (sel)? mux1:mux2;         
  endmodule

