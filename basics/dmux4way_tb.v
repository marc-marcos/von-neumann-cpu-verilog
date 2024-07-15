`include "basics/multiplexers.v"

module dmux4way_tb();
    reg in;
    reg [1:0] sel;
    wire a, b, c, d;

    dmux4way d1(a, b, c, d, in, sel);

    initial begin;
        $dumpfile("dmux4way.vcd");
        $dumpvars(0, dmux4way_tb);

        repeat(100) begin;
            in = $random;
            sel = $random;
            #10;
        end;
    end;
endmodule;