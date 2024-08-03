`include "memory/memory.v"

module ram8_tb;
    reg clk, load;
    reg [2:0] address;
    reg [15:0] in;
    wire [15:0] out;

    ram8 r1(out, in, address, load, clk);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        address = 'h001;
        load = 'b1;
        in = 'hABAB;
        #10;
        address = 'h001;
        load = 'b0;
        in = 'hCDCD;
        #10;
        $finish;
    end;

    initial begin;
        $dumpfile("ram8.vcd");
        $dumpvars(0, ram8_tb);
    end;
endmodule;