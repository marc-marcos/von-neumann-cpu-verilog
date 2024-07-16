`include "basics/multi_bit_gates.v"

module not16_tb();
    reg [15:0] a, b;
    wire [15:0] out;

    and16 and16_1(out, a, b);

    initial begin
        $dumpfile("not16.vcd");
        $dumpvars(0, not16_tb);

        repeat (100) begin
            a = $random;
            b = $random;
            #1;
        end
    end
endmodule;