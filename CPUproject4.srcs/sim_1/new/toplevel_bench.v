`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module toplevel_bench();

reg clk, reset;
reg [2:0] INR;
wire [15:0] outvalue;

TopLevel DUT(.clk(clk), .reset(reset), .INR(INR), .Outvalue(outvalue));

always #20 clk = ~clk;

initial
begin
 clk = 0;
 reset = 0;
 
 #20 INR = 3'b010;
 #20 INR = 3'b011;
 
 #20
 
 #20 INR = 3'b011;
 #20 INR = 3'b110;
 
// #20 reset = 1;
 //#40 reset = 0;
 
 #20 INR = 3'b010;
 #60 INR = 3'b011;
 
 #20
 
 #20 INR = 3'b010;
 #20 INR = 3'b011;
 
 end
 
endmodule
