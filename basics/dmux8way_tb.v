`include "basics/multiplexers.v"

module dmux8way_tb();
    reg in;
    reg [2:0] sel;
    wire a, b, c, d, e, f, g, h;

    dmux8way d1(a, b, c, d, e, f, g, h, in, sel);

    integer i;

    initial begin;
        $dumpfile("dmux8way.vcd");
        $dumpvars(0, dmux8way_tb);

        for (i = 0; i < 16; i = i + 1) begin;
            {in, sel} = i;
            #10;
        end;
    end;
endmodule;