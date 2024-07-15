`include "basics/elementary_gates.v"

module xor_gate_tb;
    wire out;
    reg a, b;

    xor_gate xor1(out, a, b);

    initial begin
        $dumpfile("xor_gate.vcd");
        $dumpvars(0, xor_gate_tb);

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