`include "circuits/adders.v"

module half_adder_tb();
    reg a, b;
    wire sum, carry;

    half_adder ha1(sum, carry, a, b);

    integer i;

    initial begin;
        $dumpfile("half_adder.vcd");
        $dumpvars(0, half_adder_tb);

        for (i = 0; i < 4; i = i + 1) begin;
            {a, b} = i;
            #10;
        end;
    end;
endmodule;