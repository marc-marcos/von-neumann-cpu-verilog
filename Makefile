all: 

# elementary gates and basic circuits

and_gate: basics/and_gate_tb.v
	iverilog -o basics/and_gate basics/and_gate_tb.v

not_gate: basics/not_gate_tb.v
	iverilog -o basics/not_gate basics/not_gate_tb.v

or_gate: basics/or_gate_tb.v
	iverilog -o basics/or_gate basics/or_gate_tb.v

xor_gate: basics/xor_gate_tb.v
	iverilog -o basics/xor_gate basics/xor_gate_tb.v

mux: basics/mux_tb.v
	iverilog -o basics/mux_gate basics/mux_tb.v

dmux: basics/dmux_tb.v
	iverilog -o basics/dmux_gate basics/dmux_tb.v

mux16: basics/mux16_tb.v
	iverilog -o basics/mux16 basics/mux16_tb.v

not16: basics/not16_tb.v
	iverilog -o basics/not16 basics/not16_tb.v

and16: basics/and16_tb.v
	iverilog -o basics/and16 basics/and16_tb.v

or8way: basics/or8way_tb.v
	iverilog -o basics/or8way basics/or8way_tb.v

mux4way16: basics/mux4way16_tb.v
	iverilog -o basics/mux4way16 basics/mux4way16_tb.v

mux8way16: basics/mux8way16_tb.v
	iverilog -o basics/mux8way16 basics/mux8way16_tb.v

dmux4way: basics/dmux4way_tb.v
	iverilog -o basics/dmux4way basics/dmux4way_tb.v

dmux8way: basics/dmux8way_tb.v
	iverilog -o basics/dmux8way basics/dmux8way_tb.v

clean:
	rm -rf basics/and_gate basics/not_gate basics/or_gate basics/xor_gate basics/mux_gate basics/dmux_gate basics/not16 basics/and16 basics/mux16 basics/or8way basics/dmux8way basics/dmux4way basics/mux8way16
	rm -rf *.vcd