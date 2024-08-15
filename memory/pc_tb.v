`include "memory/pc.v"

module pc_tb();
    reg [15:0] in;
    reg load, inc, reset, clk;
    wire [15:0] out;

    pc pc1(out, in, load, inc, reset, clk);

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        load = 1'b1;
        inc = 1'b0;
        reset = 1'b0;
        in = 4'b1010;
        #10;
        load = 1'b0;
        inc = 1'b1;
        reset = 1'b0;
        in = 4'b1010;
        #10;
        load = 1'b0;
        inc = 1'b1;
        reset = 1'b0;
        in = 4'b1010;
        #10;
        load = 1'b0;
        inc = 1'b0;
        reset = 1'b1;
        in = 4'b1010;
        #10;
        load = 1'b1;
        inc = 1'b0;
        reset = 1'b0;
        in = 16'hFFFF;
        #10;
        $finish;
    end

    initial begin
        $dumpfile("pc.vcd");
        $dumpvars(0, pc_tb);
    end
endmodule;
