`include "basics/multiplexers.v"

module mux4way16_tb();
    reg [15:0] a, b, c, d;
    reg [1:0] sel;
    wire [15:0] out;

    mux4way16 m1(out, a, b, c, d, sel);

    initial begin
        $dumpfile("mux4way16.vcd");
        $dumpvars(0, mux4way16_tb);

        repeat (100) begin
            a = $random;
            b = $random;
            c = $random;
            d = $random;
            sel = $random;
            #1;
        end
    end
endmodule;