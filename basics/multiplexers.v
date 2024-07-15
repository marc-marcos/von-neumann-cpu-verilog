`include "basics/elementary_gates.v"

module mux_gate(out, a, b, sel);
    input a, b, sel;
    output out;

    wire selNot, aAndselNot, aAndsel;

    not_gate not1(selNot, sel);

    and_gate and1(aAndselNot, a, selNot);
    and_gate and2(aAndsel, b, sel);

    or_gate or1(out, aAndselNot, aAndsel);
endmodule

module dmux_gate(a, b, in, sel);
    input in, sel;
    output a, b;

    wire selNot;

    not_gate not1(selNot, sel);

    and_gate a1(a, in, selNot); 
    and_gate a2(b, in, sel); 
endmodule

module mux_16(out, a, b, sel);
    input [15:0] a, b;
    input sel;
    output [15:0] out;

    genvar i;

    generate
        for (i = 0; i < 16; i = i + 1) begin
            mux_gate m1(out[i], a[i], b[i], sel);
        end
    endgenerate
endmodule

module mux4way16(out, a, b, c, d, sel);
    input [15:0] a, b, c, d;
    input [1:0] sel;
    output [15:0] out;

    wire [15:0] muxab, muxcd;

    mux_16 m1(muxab, a, b, sel[0]);
    mux_16 m2(muxcd, c, d, sel[0]);

    mux_16 m3(out, muxab, muxcd, sel[1]);
endmodule;

module mux8way16(out, a, b, c, d, e, f, g, h, sel);
    input [15:0] a, b, c, d, e, f, g, h;
    input [2:0] sel;
    output [15:0] out;

    wire [15:0] mux0, mux1;

    mux4way16 m1(mux0, a, b, c, d, sel[1:0]);
    mux4way16 m2(mux1, e, f, g, h, sel[1:0]);

    mux_16 m3(out, mux0, mux1, sel[2]);
endmodule;

module dmux4way(a, b, c, d, in, sel);
    input in;
    input [1:0] sel;
    output a, b, c, d;

    wire selNot0, selNot1, out1, out2;

    not_gate n1(selNot0, sel[0]);
    not_gate n2(selNot1, sel[1]);

    dmux_gate d1(out1, out2, in, sel[1]);
    dmux_gate d2(a, b, out1, sel[0]);
    dmux_gate d3(c, d, out2, sel[0]);
endmodule;

module dmux8way(a, b, c, d, e, f, g, h, in, sel);
    input in;
    input [2:0] sel;
    output a, b, c, d, e, f, g, h;

    wire out1, out2;

    dmux_gate d1(out1, out2, in, sel[2]);

    dmux4way d2(a, b, c, d, out1, sel[1:0]);
    dmux4way d3(e, f, g, h, out2, sel[1:0]);

endmodule;