`include "memory/memory.v"

module testbench;
    reg clk;
    reg load;
    reg in;
    
    wire out;

    bit b1(out, in, load, clk);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        load = 0;
        in = 0;

        #10 load = 0; in = 1;
        #10 load = 0; in = 0;

        #10 load = 1; in = 1;
        #10 load = 1; in = 0;

        #10 load = 0; in = 1;
        #10 load = 0; in = 0;

        #10 load = 1; in = 1;
        #10 load = 1; in = 0;

        #10 $finish;
    end

    initial begin
        $dumpfile("bit.vcd");
        $dumpvars(0, testbench);
    end
endmodule
