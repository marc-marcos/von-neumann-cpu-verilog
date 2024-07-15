`include "basics/multi_bit_gates.v"

module or8way_tb();
    reg [7:0] in;
    wire out;

    or8way or1(out, in);

    integer i;

    initial begin;
        $dumpfile("or8way.vcd");
        $dumpvars(0, or8way_tb);

        in = 0;
        #10;

        repeat (24) begin
            in = $random;
            #10;
        end

        in = 0;
        #10;
    end;
endmodule;