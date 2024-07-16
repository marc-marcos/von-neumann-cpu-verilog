`include "circuits/adders.v"

module add16_tb();
    reg [15:0] a, b;
    wire [15:0] out;

    add16 a1(out, a, b);

    initial begin;
        $dumpfile("add16.vcd");
        $dumpvars(0, add16_tb);

        repeat (100) begin;
            a = $random;
            b = $random;
            #10;
        end;
    end;

endmodule;