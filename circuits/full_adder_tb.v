`include "circuits/adders.v"

module half_adder_tb();
    reg a, b, c;
    wire sum, carry;

    full_adder fa1(sum, carry, a, b, c);

    integer i;

    initial begin;
        $dumpfile("full_adder.vcd");
        $dumpvars(0, half_adder_tb);

        for (i = 0; i < 8; i = i + 1) begin;
            {a, b, c} = i;
            #10;
        end;
    end;
endmodule;