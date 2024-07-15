`include "basics/elementary_gates.v"

module or_gate_tb;
    wire out;
    reg a, b;

    or_gate or1(out, a, b);

    initial begin
        $dumpfile("or_gate.vcd");
        $dumpvars(0, or_gate_tb);

        a = 0; b = 0;
        #1
        a = 0; b = 1;
        #1
        a = 1; b = 0;
        #1
        a = 1; b = 1;
        #1
        a = 0; b = 0;
    end
endmodule;