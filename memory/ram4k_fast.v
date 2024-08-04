`ifndef RAM4K
`define RAM4K

module ram4k (out, in, address, load, clk);
    output reg [15:0] out;
    input [15:0] in;
    input [11:0] address;
    input load;
    input clk;

    reg [15:0] mem [0:4095];

    always @(posedge clk) begin
        if (load) begin
            mem[address] <= in;
        end
        out <= mem[address];
    end
endmodule

`endif
