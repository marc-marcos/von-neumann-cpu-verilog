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

        repeat(10) begin
            x = $random;
            y = $random;
            zx = $random;
            nx = $random;
            zy = $random;
            ny = $random;
            f = $random;
            no = $random;
            #10;
        end
    end
endmodule;