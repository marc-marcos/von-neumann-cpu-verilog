`include "basics/multiplexers.v"

module mux16_tb();
    reg [15:0] a, b;
    reg sel;
    wire [15:0] out;

    integer i;

    mux_16 mux1(out, a, b, sel);

    initial begin
        $dumpfile ("mux16.vcd");
        $dumpvars(0, mux16_tb);

        repeat (100) begin
            a = $random;
            b = $random;
            sel = $random;
            #1;
        end
    end
endmodule;