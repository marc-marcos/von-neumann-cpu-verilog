`include "memory/memory.v"

module ram512_tb();
    reg load, clk;
    reg [8:0] address;
    reg [15:0] in;
    wire [15:0] out;

    ram512 r1(out, in, address, load, clk);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        address = 'h00;
        load = 'b1;
        in = 'hABAB;
        #10;
        address = 'h3F;
        load = 'b1;
        in = 'hCDCD;
        #10;
        address = 'h00;
        load = 'b0;
        in = 'h1111;
        #10;
        address = 'h3F;
        load = 'b0;
        in = 'h1111;
        #10;
        $finish;
    end

    initial begin
        $dumpfile("ram512.vcd");
        $dumpvars(0, ram512_tb);
    end
endmodule;
