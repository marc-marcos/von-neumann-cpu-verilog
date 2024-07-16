`include "circuits/adders.v"

module inc16_tb();
    reg [15:0] in; 
    wire [15:0] out;

    inc16 inc1(out, in);

    initial begin;
        $dumpfile("inc16.vcd");
        $dumpvars(0, inc16_tb);

        repeat (100) begin;
            in = $random;
            #10;
        end;
    end;
endmodule;