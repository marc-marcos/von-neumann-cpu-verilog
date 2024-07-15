`include "basics/multi_bit_gates.v"

module or16_tb();
    reg [15:0] a, b;
    wire [15:0] out;

    and16 and16_1(a, b, out);

    initial begin
        $dumpfile("not16.vcd");
        $dumpvars(0, or16_tb);

        repeat (100) begin
            a = $random;
            b = $random;
            #1;
        end
    end
endmodule;