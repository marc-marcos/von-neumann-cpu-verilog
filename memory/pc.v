`include "memory/memory.v"
`include "basics/multiplexers.v"
`include "circuits/adders.v"
`ifndef PC
`define PC

module pc(out, in, load, inc, reset, clk);
    input [15:0] in;
    input load, inc, reset, clk;
    output [15:0] out;

    wire [15:0] outInc, outInced, outLoaded, outResetted, out_ant;

    assign out_ant = out;

    inc16 inc1(outInc, out_ant);
    mux_16 m1(outInced, out_ant, outInc, inc);
    mux_16 m2(outLoaded, outInced, in, load);
    mux_16 m3(outResetted, outLoaded, 16'b0, reset);
    register r1(out, outResetted, 1'b1, clk);

endmodule;

`endif
