//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Thu Apr 18 20:02:48 2019
//Host        : PAUL running 64-bit major release  (build 9200)
//Command     : generate_target block_ram_wrapper.bd
//Design      : block_ram_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module block_ram_wrapper
   (addra_0,
    clka_0,
    dina_0,
    douta_0,
    wea_0);
  input [9:0]addra_0;
  input clka_0;
  input [15:0]dina_0;
  output [15:0]douta_0;
  input [0:0]wea_0;

  wire [9:0]addra_0;
  wire clka_0;
  wire [15:0]dina_0;
  wire [15:0]douta_0;
  wire [0:0]wea_0;

  block_ram block_ram_i
       (.addra_0(addra_0),
        .clka_0(clka_0),
        .dina_0(dina_0),
        .douta_0(douta_0),
        .wea_0(wea_0));
endmodule
