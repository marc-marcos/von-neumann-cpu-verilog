`ifndef RAM64
`define RAM64

`include "basics/multiplexers.v"
`include "memory/memory.v"

module ram64(out, in, address, load, clk);
    input [15:0] in;
    input load, clk;
    input [5:0] address;
    output [15:0] out;

    wire loada, loadb, loadc, loadd, loade, loadf, loadg, loadh;
    wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;

    dmux8way d1(loada, loadb, loadc, loadd, loade, loadf, loadg, loadh, load, address[5:3]);
    ram8 r0(out0, in, address[2:0], loada, clk);
    ram8 r1(out1, in, address[2:0], loadb, clk);
    ram8 r2(out2, in, address[2:0], loadc, clk);
    ram8 r3(out3, in, address[2:0], loadd, clk);
    ram8 r4(out4, in, address[2:0], loade, clk);
    ram8 r5(out5, in, address[2:0], loadf, clk);
    ram8 r6(out6, in, address[2:0], loadg, clk);
    ram8 r7(out7, in, address[2:0], loadh, clk);
    mux8way16 m1(out, out0, out1, out2, out3, out4, out5, out6, out7, address[5:3]);
endmodule;

`endif
