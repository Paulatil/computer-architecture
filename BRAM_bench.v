`timescale 1ns / 1ps

module BRAM_bench();

reg [9:0] addra_0;
reg [15:0] dina_0;
reg clka_0, wea_0;
wire [15:0] douta_0;


block_ram_wrapper UUT (.clka_0(clka_0), .dina_0(dina_0), .addra_0(addra_0), .wea_0(wea_0), .douta_0(douta_0));

always #10 clka_0 = ~clka_0;

initial
begin

 clka_0 = 0;
 wea_0 = 0;
 
 #10
 wea_0 = 1;
addra_0 = 2;
dina_0 = 23;
 
 #40
addra_0 = 3;
dina_0 = 45;
 
 #40
addra_0 = 1;
dina_0 = 50;
 
 #20
 wea_0 = 0;
 #20
 
 #20
addra_0 = 1;
 
 #40 
addra_0 = 2;
 
 #40
addra_0 = 3;
 
 end

endmodule
