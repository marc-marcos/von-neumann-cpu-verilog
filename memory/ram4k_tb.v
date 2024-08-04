`include "memory/ram4k_faster.v"

module ram4k_tb();
    reg load,clk; 
    reg [11:0] address;
    reg [15:0] in;
    wire [15:0] out;

    initial begin
        clk = 0;
        forever begin
            #5 clk = ~clk; 
        end
    end

    ram4k r1(out, in, address, load, clk);

    initial begin
        address = 'h00;
        load = 'b1;
        in = 'hABAB;
        #10;
        address = 'hFFF;
        load = 'b1;
        in = 'hCDCD;
        #10;
        address = 'h00;
        load = 'b0;
        in = 'h1111;
        #10;
        address = 'hFFF;
        load = 'b0;
        in = 'h1111;
        #10;
        $finish;
    end

    initial begin
        $dumpfile("ram4k.vcd");
        $dumpvars(0, ram4k_tb);
    end


endmodule;
