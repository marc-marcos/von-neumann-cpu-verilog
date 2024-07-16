`include "basics/elementary_gates.v"
`ifndef ADDERS_V
`define ADDERS_V
module half_adder(sum, carry, a, b);
    input a, b;
    output sum, carry;

    and_gate a1(carry, a, b);
    xor_gate x1(sum, a, b);
endmodule;

module full_adder(sum, carry, a, b, c);
    input a, b, c;
    output sum, carry;

    wire carryab, carrysumabc, sumab;

    half_adder ha1(sumab, carryab, a, b);
    half_adder ha2(sum, carrysumabc, sumab, c);

    or_gate or1(carry, carryab, carrysumabc);
endmodule;

module add16(out, a, b);
    input [15:0] a, b;
    output [15:0] out;

    wire [15:0] carry;

    genvar i;

    generate
        for (i = 0; i < 16; i = i + 1) begin
            if (i == 0) begin
                full_adder fa(out[i], carry[i], a[i], b[i], 1'b0);
            end else begin
                full_adder fa(out[i], carry[i], a[i], b[i], carry[i-1]);
            end
        end
    endgenerate
endmodule;

module inc16(out, in);
    input [15:0] in;
    output [15:0] out;

    add16 a1(out, in, 16'b1);
endmodule;
`endif