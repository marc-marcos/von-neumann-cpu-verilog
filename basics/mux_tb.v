`include "basics/multiplexers.v"

module mux_tb;
    reg a, b, sel;
    wire out;

    integer i;

    mux_gate mux1(out, a, b, sel);

    initial begin
        $dumpfile ("mux_gate.vcd");
        $dumpvars(0, mux_tb);

        for (i = 0; i < 16; i = i + 1) begin
            {a, b, sel} = i;
            #10;
        end
    end

endmodule;