`include "final/fast_rom.v"

module fast_memory_tb();
    reg [15:0] address;
    reg clk;
    wire [15:0] out;

    fast_rom fr1(out, address, clk);

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk;
        end
    end

    initial begin
        address = 'h00;
        #10;
        address = 'h7FFF;
        #10;
        address = 'h0000;
        #10;
        address = 'h7FFF;
        #10;
        $finish;
    end

    initial begin
        $dumpfile("fast_rom.vcd");
        $dumpvars(0, fast_memory_tb);
    end

endmodule;
