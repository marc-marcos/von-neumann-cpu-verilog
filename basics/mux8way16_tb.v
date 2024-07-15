`include "basics/multiplexers.v"

module mux8way16_tb();
    reg [15:0] a, b, c, d, e, f, g, h;
    reg [2:0] sel;
    wire [15:0] out;
    
    mux8way16 m1(out, a, b, c, d, e, f, g, h, sel);

    initial begin;
        $dumpfile("mux8way16.vcd");
        $dumpvars(0, mux8way16_tb);

        repeat (100) begin;
            a = $random;
            b = $random;
            c = $random;
            d = $random;
            e = $random;
            f = $random;
            g = $random;
            h = $random;
            sel = $random;
            #10;
        end;
    end;

endmodule;
