`include "basics/multiplexers.v"

`ifndef MEMORY_V
`define MEMORY_V
module bit(out, in, load, clk);
    input wire in, load, clk;
    output reg out;

    wire d;

    assign d = (load) ? in : out;

    always @(posedge clk) begin
        out <= d;
    end
endmodule

module register(out, in, load, clk);
    input [15:0] in; 
    input load, clk;
    output [15:0] out;

    bit b0 (out[0], in[0], load, clk);
    bit b1 (out[1], in[1], load, clk);
    bit b2 (out[2], in[2], load, clk);
    bit b3 (out[3], in[3], load, clk);

    bit b4 (out[4], in[4], load, clk);
    bit b5 (out[5], in[5], load, clk);
    bit b6 (out[6], in[6], load, clk);
    bit b7 (out[7], in[7], load, clk);

    bit b8 (out[8], in[8], load, clk);
    bit b9 (out[9], in[9], load, clk);
    bit b10 (out[10], in[10], load, clk);
    bit b11 (out[11], in[11], load, clk);

    bit b12 (out[12], in[12], load, clk);
    bit b13 (out[13], in[13], load, clk);
    bit b14 (out[14], in[14], load, clk);
    bit b15 (out[15], in[15], load, clk);
endmodule

module ram8(out, in, address, load, clk);
    input [15:0] in;
    input load, clk;
    input [2:0] address;
    output [15:0] out;

    wire loada, loadb, loadc, loadd, loade, loadf, loadg, loadh;
    wire [15:0] out0, out1, out2, out3, out4, out5, out6, out7;

    dmux8way d1(loada, loadb, loadc, loadd, loade, loadf, loadg, loadh, load, address);
    register r0(out0, in, loada, clk);
    register r1(out1, in, loadb, clk);
    register r2(out2, in, loadc, clk);
    register r3(out3, in, loadd, clk);
    register r4(out4, in, loade, clk);
    register r5(out5, in, loadf, clk);
    register r6(out6, in, loadg, clk);
    register r7(out7, in, loadh, clk);

    mux8way16 m1(out, out0, out1, out2, out3, out4, out5, out6, out7, address);
endmodule;


`endif
