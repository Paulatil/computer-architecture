`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module ToptopLevel(clk_in2, reset, INR, Anode_Activate, Cathode_select);

input clk_in2, reset;
input[2:0] INR;
output [3:0] Anode_Activate;
output [6:0] Cathode_select;

wire [3:0] anode_wire1;
wire [6:0] cathode_wire1;
wire [2:0] inr_wire1;
wire clk_a;

assign Cathode_select = cathode_wire1;
assign Anode_Activate = anode_wire1;
assign inr_wire1 = INR;


topmost_level top (.clk(clk_a), .reset(reset), .INR(inr_wire1), .Cathode_select(cathode_wire1), .Anode_Activate(anode_wire1));
clk_ip clock (.clk_in1(clk_in2), .clk_out(clk_a));


endmodule
