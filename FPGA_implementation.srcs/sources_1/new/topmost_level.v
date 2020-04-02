`timescale 1ns / 1ps
////////
module topmost_level(clk, reset, Cathode_select, Anode_Activate, INR);

input clk, reset;
input [2:0] INR;  
output [3:0] Anode_Activate;
output [6:0] Cathode_select;

wire [15:0] outvalue_wire;
wire [3:0] anode_wire;
wire [6:0] cathode_wire;
wire [2:0] inr_wire;

assign Cathode_select = cathode_wire;
assign Anode_Activate = anode_wire;
assign inr_wire = INR;

TopLevel toplevel (.clk(clk), .reset(reset), .INR(inr_wire), .Outvalue(outvalue_wire));
bin2seven_seg_display SevensegmentDisplay (.clk(clk), .reset(reset), .Outvalue(outvalue_wire), .anode_activate(anode_wire), .cathode_select(cathode_wire));

endmodule
