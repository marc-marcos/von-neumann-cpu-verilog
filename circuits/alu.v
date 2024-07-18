`include "basics/elementary_gates.v"
`include "basics/multi_bit_gates.v"
`include "basics/multi_gates.v"
`include "basics/multiplexers.v"
`include "circuits/adders.v"

`ifndef ALU_V
`define ALU_V

module alu(out, zr, ng, x, y, zx, nx, zy, ny, f, no);
    input [15:0] x, y;
    input zx, nx, zy, ny, f, no;
    output [15:0] out;
    output zr, ng;

    wire [15:0] xZeroed, yZeroed, xNotted, yNotted, xPre, yPre, xyAnd, xyAdd, outPreNot, outNotted; 
    wire or1, or2, or3;
    wire [7:0] zr1, zr2;

    mux_16 m1(xZeroed, x, 16'b0, zx);
    mux_16 m2(yZeroed, y, 16'b0, zy);

    not16 n1(xNotted, xZeroed);
    not16 n2(yNotted, yZeroed);

    mux_16 m3(xPre, xZeroed, xNotted, nx);
    mux_16 m4(yPre, yZeroed, yNotted, ny);

    add16 a1(xyAdd, xPre, yPre);
    and16 a2(xyAnd, xPre, yPre);

    mux_16 m5(outPreNot, xyAnd, xyAdd, f);

    not16 n3(outNotted, outPreNot);

    mux_16 m6(out, outPreNot, outNotted, no);

    assign ng = out[15]; 
    assign zr1 = out[7:0];
    assign zr2 = out[15:8];

    or8way or1_gate(or1, zr1);
    or8way or2_gate(or2, zr2);
    or or3_gate(or3, or1, or2);
    not n4(zr, or3);
endmodule;

`endif