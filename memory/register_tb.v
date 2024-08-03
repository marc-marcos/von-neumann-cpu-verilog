`include "memory/memory.v"

module register_tb;
    reg clk, load;
    reg [15:0] in;
    wire [15:0] out;

    register r1(out, in, load, clk);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        repeat (100) begin
            in = $random;
            load = $random;
            #10;
        end;
        #10;
        $finish;
    end;
    

    initial begin
        $dumpfile("register.vcd");
        $dumpvars(0, register_tb);
    end
endmodule;