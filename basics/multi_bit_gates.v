`include "basics/elementary_gates.v"

`ifndef MULTI_BIT_GATES_V
`define MULTI_BIT_GATES_V
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
`endif