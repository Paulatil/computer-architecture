`timescale 1ns /1ps
module MUX2 (regsel, regmux1, regmux2, regmux_out);

input [2:0] regmux1, regmux2;
input  regsel;
output  [2:0] regmux_out;

    assign regmux_out = (regsel)? regmux1:regmux2;

endmodule