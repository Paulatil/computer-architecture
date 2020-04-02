`timescale 1ns / 1ps
module MUX3 (bsel, bmux1, bmux2, bmux_out);

input [15:0] bmux1, bmux2;
input bsel;
output  [15:0] bmux_out;

    assign bmux_out = (bsel)? bmux1:bmux2;

endmodule