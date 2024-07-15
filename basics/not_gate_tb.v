`include "basics/elementary_gates.v"

module not_gate_tb;
    reg in;
    wire out;

    not_gate not1(out, in);

    initial begin
        $dumpfile("not_gate.vcd");
        $dumpvars(0, not_gate_tb);

        in = 0; 
        #1
        in = 1;
        #1
        in = 0;
    end
endmodule