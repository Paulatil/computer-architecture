//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
//Date        : Thu Apr 18 20:20:46 2019
//Host        : PAUL running 64-bit major release  (build 9200)
//Command     : generate_target block_ram.bd
//Design      : block_ram
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "block_ram,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=block_ram,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "block_ram.hwdef" *) 
module block_ram
   (addra_0,
    clka_0,
    dina_0,
    douta_0,
    wea_0);
  input [9:0]addra_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLKA_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLKA_0, CLK_DOMAIN block_ram_clka_0, FREQ_HZ 100000000, INSERT_VIP 0, PHASE 0.000" *) input clka_0;
  input [15:0]dina_0;
  output [15:0]douta_0;
  input [0:0]wea_0;

  wire [9:0]addra_0_1;
  wire [15:0]blk_mem_gen_0_douta;
  wire clka_0_1;
  wire [15:0]dina_0_1;
  wire [0:0]wea_0_1;

  assign addra_0_1 = addra_0[9:0];
  assign clka_0_1 = clka_0;
  assign dina_0_1 = dina_0[15:0];
  assign douta_0[15:0] = blk_mem_gen_0_douta;
  assign wea_0_1 = wea_0[0];
  block_ram_blk_mem_gen_0_0 blk_mem_gen_0
       (.addra(addra_0_1),
        .clka(clka_0_1),
        .dina(dina_0_1),
        .douta(blk_mem_gen_0_douta),
        .wea(wea_0_1));
endmodule
