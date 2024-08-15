`ifndef FAST_MEMORY
`define FAST_MEMORY

module fast_memory (out, in, address, load, clk);
    output reg [15:0] out;
    input [15:0] in;
    input [14:0] address;
    input load, clk;

    reg [15:0] mem[0:24576];

    `ifdef PROGRAM_FROM_FILE
        initial begin
            $display("Loading ROM from hex file.");
            $readmemh("ram.mem", mem);
        end
    `endif

    always @(posedge clk) begin
        if (address < 15'h6001) begin
            out = mem[address];
        end else begin
            out = 16'h0000;
        end
    end

    always @(posedge clk) begin
        if (load && (address < 15'h6001)) begin
            mem[address] = in;
        end
    end

endmodule

`endif
