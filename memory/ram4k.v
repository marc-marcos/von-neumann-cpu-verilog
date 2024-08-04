`ifndef RAM4K_V
`define RAM4K_V

`include "memory/ram512.v"
`include "basics/multiplexers.v"

module ram4k(out, in, address, load, clk);
    input [15:0] in;
    input load, clk;
    input [11:0] address;
    output [15:0] out;

    wire loada, loadb, loadc, loadd, loade, loadf, loadg, loadh;
    wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;

    dmux8way d1(loada, loadb, loadc, loadd, loade, loadf, loadg, loadh, load, address[11:9]);

    ram512 r0(out0, in, address[8:0], loada, clk);
    ram512 r1(out1, in, address[8:0], loadb, clk);
    ram512 r2(out2, in, address[8:0], loadc, clk);
    ram512 r3(out3, in, address[8:0], loadd, clk);
    ram512 r4(out4, in, address[8:0], loade, clk);
    ram512 r5(out5, in, address[8:0], loadf, clk);
    ram512 r6(out6, in, address[8:0], loadg, clk);
    ram512 r7(out7, in, address[8:0], loadh, clk);

    mux8way16 m1(out, out0, out1, out2, out3, out4, out5, out6, out7, address[11:9]);
endmodule;
`endif
