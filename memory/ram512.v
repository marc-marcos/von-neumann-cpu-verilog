`ifndef RAM_512
`define RAM_512

`include "basics/multiplexers.v"
`include "memory/ram64.v"

module ram512(out, in, address, load, clk);
    input [15:0] in;
    input load, clk;
    input [8:0] address;
    output [15:0] out;

    wire loada, loadb, loadc, loadd, loade, loadf, loadg, loadh;
    wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;

    dmux8way d1(loada, loadb, loadc, loadd, loade, loadf, loadg, loadh, load, address[8:6]);

    ram64 r0(out0, in, address[5:0], loada, clk);
    ram64 r1(out1, in, address[5:0], loadb, clk);
    ram64 r2(out2, in, address[5:0], loadc, clk);
    ram64 r3(out3, in, address[5:0], loadd, clk);
    ram64 r4(out4, in, address[5:0], loade, clk);
    ram64 r5(out5, in, address[5:0], loadf, clk);
    ram64 r6(out6, in, address[5:0], loadg, clk);
    ram64 r7(out7, in, address[5:0], loadh, clk);

    mux8way16 m1(out, out0, out1, out2, out3, out4, out5, out6, out7, address[8:6]);
endmodule;

`endif
