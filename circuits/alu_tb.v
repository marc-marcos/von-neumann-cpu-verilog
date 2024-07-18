`include "circuits/alu.v"

module alu_tb();
    reg [15:0] x, y;
    reg zx, nx, zy, ny, f, no;
    wire [15:0] out;
    wire zr, ng;

    alu a1(out, zr, ng, x, y, zx, nx, zy, ny, f, no);

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        x = $random;
        y = $random;
        zx = 1'b1;
        nx = 1'b0;
        zy = 1'b1;
        ny = 1'b0;
        f = 1'b0;
        no = 1'b1;
        #10;
    end
endmodule;