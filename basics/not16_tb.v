`include "basics/multi_bit_gates.v"

module not16_tb();
    reg [15:0] in;
    wire [15:0] out;

    not16 not16_1(out, in);

    integer i;

    initial begin
        $dumpfile("not16.vcd");
        $dumpvars(0, not16_tb);

        for (i = 0; i < 65536; i = i + 1) begin
            in = i;
            #1;
        end
    end
endmodule;
