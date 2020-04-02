`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////
module mostToplevel(clk1, reset, INR1, Cathode_sel, Anode_sel);

input clk1, reset;
input [2:0] INR1;
output [3:0] Anode_sel;
output [6:0] Cathode_sel;

wire clka;
wire [2:0] inr_wire1;
wire [6:0] cathode_wire1;
wire [3:0] anode_wire1;

assign Cathode_sel = cathode_wire1;
assign Anode_sel = anode_wire1;
assign inr_wire1 = INR1;

topmost_level toplevel (.clk(clka), .reset(reset), .INR(inr_wire1), .Cathode_select(cathode_wire1), .Anode_Activate(anode_wire1));

clk_ip clock (.clk_in1(clk1), .clk_out(clka));


endmodule
