`include "basics/multiplexers.v"

module dmux_tb;
    reg in, sel;
    wire a, b;

    integer i;

    dmux_gate dmux1(a, b, in, sel);

    initial begin
        $dumpfile ("dmux_gate.vcd");
        $dumpvars(0, dmux_tb);

        for (i = 0; i < 4; i = i + 1) begin
            {in, sel} = i;
            #10;
        end
    end

endmodule;