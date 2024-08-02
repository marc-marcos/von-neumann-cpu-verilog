module bit(out, in, load, clk);
    input wire in, load, clk;
    output reg out;

    wire d;

    assign d = (load) ? in : out;

    always @(posedge clk) begin
        out <= d;
    end
endmodule