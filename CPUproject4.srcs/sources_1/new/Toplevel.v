`timescale 1ns /1ps

module TopLevel (clk, reset, INR, Outvalue);

input [2:0] INR;
input clk, reset;
output [15:0] Outvalue;

wire [15:0] outvalue, pc_addr, Imem, Wbus, Rbus, addbus;
wire [2:0] inr;
wire memw, memr;

assign inr = INR;
assign Outvalue = outvalue;

datapath datapath(.clk(clk), .reset(reset), .INR(inr), .Outvalue(outvalue), .WBus(Wbus), .RBus(Rbus), .addBus(addbus), .IMEM(Imem), .PC_addr(pc_addr), .memW(memw), .memR(memr));

IMem Imemory (.clk(clk), .Instruct(Imem), .PC_addr(pc_addr));

block_ram_wrapper dataMemory (.clka_0(clk), .dina_0(Wbus), .douta_0(Rbus), .addra_0(addbus[9:0]), .wea_0(memw));


endmodule
