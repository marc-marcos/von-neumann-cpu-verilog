`include "basics/elementary_gates.v"

module not16(out, in);
    input[15:0] in;
    output[15:0] out;

    genvar i;

    generate 
        for (i = 0; i < 16; i = i + 1) begin
            assign out[i] = ~in[i];
        end
    endgenerate

endmodule;

module and16(out, a, b);
    input[15:0] a, b;
    output[15:0] out;

    genvar i;

    generate 
        for (i = 0; i < 16; i = i + 1) begin
            assign out[i] = a[i] & b[i];
        end
    endgenerate

endmodule;

module or16(out, a, b);
    input[15:0] a, b;
    output[15:0] out;

    genvar i;

    generate 
        for (i = 0; i < 16; i = i + 1) begin
            assign out[i] = a[i] | b[i];
        end
    endgenerate

endmodule;

module or8way(out, in);
    input [7:0] in;
    output out;

    wire or01, or23, or34, or45, or67, orfirst, orsecond;

    or_gate or1(or01, in[0], in[1]);
    or_gate or2(or23, in[2], in[3]);
    or_gate or3(or45, in[4], in[5]);
    or_gate or4(or67, in[6], in[7]);

    or_gate or5(orfirst, or01, or23);
    or_gate or6(orsecond, or45, or67);

    or_gate or7(out, orfirst, orsecond);
endmodule;