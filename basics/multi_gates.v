`include "basics/elementary_gates.v"

module or8way(out, in);
    input [7:0] in;
    output out;

    wire or01, or23, or45, or67, orbigone, orbigtwo;

    or_gate or1(or01, in[0], in[1]);
    or_gate or2(or23, in[2], in[3]);
    or_gate or3(or45, in[4], in[5]);
    or_gate or4(or67, in[6], in[7]);

    or_gate or5(orbigone, or01, or23);
    or_gate or6(orbigtwo, or45, or67);

    or_gate or7(out, orbigone, orbigtwo);
endmodule