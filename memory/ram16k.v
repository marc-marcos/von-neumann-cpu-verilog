`ifndef RAM16K_V
`define RAM16K_V

`include "basics/multiplexers.v"
`include "memory/ram4k_fast.v"

module ram16k(out, in, address, load, clk);
    input [15:0] in;
    input load, clk;
    input [13:0] address;
    output [15:0] out;

    wire loada, loadb, loadc, loadd;
    wire [15:0] out0, out1, out2, out3;

    dmux4way(loada, loadb, loadc, loadd, in, address[13:12]);

    ram4k r1(out0, in, address[11:0], loada, clk); 
    ram4k r2(out1, in, address[11:0], loadb, clk); 
    ram4k r3(out2, in, address[11:0], loadc, clk); 
    ram4k r4(out3, in, address[11:0], loadd, clk); 

    mux4way16(out, out0, out1, out2, out3, address[13:12]);

`endif
