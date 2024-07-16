`ifndef ELEMENTARY_GATES_V
`define ELEMENTARY_GATES_V
module not_gate(out, in);
    input in;
    output out;

    nand nand1(out, in, in);
endmodule

module and_gate(out, a, b);
    input a, b;
    output out;

    wire anandb;

    nand nand1(anandb, a, b);
    not_gate not1(out, anandb);
endmodule

module or_gate(out, a, b);
    input a, b;
    output out;
    
    wire aNot, bNot;

    not_gate not1(aNot, a);
    not_gate not2(bNot, b);

    nand nand1(out, aNot, bNot);
endmodule

module xor_gate(out, a, b);
    input a, b;
    output out;

    wire aNot, bNot, aAndbNot, bAndaNot;

    not_gate not1(aNot, a);
    not_gate not2(bNot, b);

    and_gate and1(aAndbNot, a, bNot);
    and_gate and2(bAndaNot, aNot, b);

    or_gate or1(out, aAndbNot, bAndaNot);
endmodule
`endif