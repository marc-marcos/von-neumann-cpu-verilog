`include "basics/elementary_gates.v"

module and_gate_tb;
    reg a, b;
    wire out;

    and_gate and1(out, a, b);

    initial begin
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_gate_tb);

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
endmodule