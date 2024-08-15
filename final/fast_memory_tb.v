`include "final/fast_memory.v"

module fast_memory_tb();
    reg [15:0] in;
    reg [14:0] address;
    reg load, clk;
    wire [15:0] out;

    fast_memory f1(out, in, address, load, clk);

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        address = 'h00;
        load = 'b0;
        in = 'hABAB;
        #10;
        address = 'h00;
        load = 'b1;
        in = 'hABAB;
        #10;
        address = 'h6000;
        load = 'b1;
        in = 'hABAB;
        #10;
        address = 'h6001;
        load = 'b1;
        in = 'hABAB;
        #10;
        address = 'h00;
        load = 'b0;
        in = 'hCDCD;
        #10;
        address = 'h6000;
        load = 'b0;
        in = 'hCDCD;
        #10;
        address = 'h6001;
        load = 'b0;
        in = 'hCDCD;
        #10;
        address = 'h00;
        load = 'b0;
        in = 'hCDCD;
        #10;
        $finish;
    end

    initial begin
        $dumpfile("fast_memory.vcd");
        $dumpvars(0, fast_memory_tb);
    end

endmodule;
