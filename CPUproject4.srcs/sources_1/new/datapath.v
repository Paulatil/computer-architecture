`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module datapath(clk, reset, Outvalue, INR, RBus, WBus, IMEM, memW, memR, addBus, PC_addr);

input [15:0] RBus,IMEM;
input clk, reset; 
input [2:0] INR;
output [15:0] Outvalue, WBus, addBus, PC_addr;
output memW, memR; 

wire [15:0] Rbus, imem_out, pc_addr, ALU_out, Data1, Data2, Imm, outvalue, Data_in, pc_in; 
wire [15:0] PC_incr, branch_addr, PC_br, ALUin2, PC_jump, one; 
wire  Zeroflag, Jc, Bc, regWSrc, mem2Reg, regImm, memr, memw, regwrite; 
wire [2:0] inr, dreg, a_control;
wire [3:0] aLUopcode;

assign one = 1;
assign inr = INR;
assign addBus = ALU_out;
assign Outvalue = outvalue;
assign memW = memw;
assign memR = memr;
assign WBus = Data2;
assign PC_addr = pc_addr;
assign imem_out = IMEM;
assign Rbus = RBus;


controller maincontrol (.reset(reset), .ALUopcode(aLUopcode), .opcode(imem_out[15:12]), .zeroflag(Zeroflag), .jc(Jc), .bc(Bc), .RegWSrc(regWSrc), .Mem2Reg(mem2Reg), .RegImm(regImm), .memR(memr), .memW(memw), .RegWrite(regwrite));

Registers regfile (.clk(clk), .reset(reset), .data_in(Data_in), .Sreg1(imem_out[11:9]), .Sreg2(imem_out[8:6]), .Dreg(dreg), .inR(inr), .Outvalue(outvalue), .regWrite(regwrite), .data1(Data1), .data2(Data2));

PC program_counter (.PC_in(pc_in), .PC_out(pc_addr), .reset(reset), .clk(clk));

signextend signextender (.immediate(imem_out[5:0]), .extended(Imm));

ALUcontrol arithmetic_control (.reset(reset), .A_control(a_control), .Fcode(imem_out[2:0]), .ALUopcode(aLUopcode));

ALU arithmetic_unit (.zeroflag(Zeroflag), .A_control(a_control), .out1(ALU_out), .I1(Data1), .I2(ALUin2));

ADD PC_increment (.addin1(one), .addin2(pc_addr), .add_out(PC_incr));

ADD branch (.addin1(Imm), .addin2(PC_incr), .add_out(branch_addr));

MUX jump_select (.mux1({PC_incr[15:12], imem_out[11:0]}), .mux2(PC_br), .mux_out(pc_in), .sel(Jc));

MUX  data_memory (.mux1(ALU_out), .mux2(Rbus), .mux_out(Data_in), .sel(mem2Reg));

MUX2 destination_source (.regmux1(imem_out[5:3]), .regmux2(imem_out[8:6]), .regmux_out(dreg), .regsel(regWSrc));

MUX3 branch_select (.bmux1(branch_addr), .bmux2(PC_incr), .bmux_out(PC_br), .bsel(Bc));

MUX ALUsource (.mux1(Data2), .mux2(Imm), .mux_out(ALUin2), .sel(regImm));

endmodule
