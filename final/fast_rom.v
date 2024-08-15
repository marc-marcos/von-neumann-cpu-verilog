`ifndef FAST_ROM
`define FAST_ROM

module fast_rom (out, address, clk);
    output reg [15:0] out;
    input [15:0] address;
    input clk;

    reg [15:0] mem[0:32767];

    `ifdef PROGRAM_FROM_FILE
        initial begin
            $display("Loading ROM from hex file.");
            $readmemh("rom.mem", mem);
        end
    `endif

    always @(posedge clk) begin
        out = mem[address];
    end
endmodule

`endif
