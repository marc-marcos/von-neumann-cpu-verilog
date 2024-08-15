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

# adder circuits (project 2)

half_adder: circuits/half_adder_tb.v
	iverilog -o circuits/half_adder circuits/half_adder_tb.v

full_adder: circuits/full_adder_tb.v
	iverilog -o circuits/full_adder circuits/full_adder_tb.v

add16: circuits/add16_tb.v
	iverilog -o circuits/add16 circuits/add16_tb.v

inc16: circuits/inc16_tb.v
	iverilog -o circuits/inc16 circuits/inc16_tb.v

# alu
alu: circuits/alu_tb.v
	iverilog -o circuits/alu circuits/alu_tb.v

# memory
bit: memory/bit_tb.v
	iverilog -o memory/bit memory/bit_tb.v

register: memory/register_tb.v
	iverilog -o memory/register memory/register_tb.v

ram8: memory/ram8_tb.v
	iverilog -o memory/ram8 memory/ram8_tb.v

ram64: memory/ram64_tb.v
	iverilog -o memory/ram64 memory/ram64_tb.v

ram512: memory/ram512_tb.v
	iverilog -o memory/ram512 memory/ram512_tb.v

ram4k: memory/ram4k_tb.v
	iverilog -o memory/ram4k memory/ram4k_tb.v

ram16k: memory/ram16k_tb.v
	iverilog -o memory/ram16k memory/ram16_tb.v

pc: memory/pc_tb.v
	iverilog -o memory/pc memory/pc_tb.v

# final

fast_memory: final/fast_memory_tb.v
	iverilog -o final/fast_memory final/fast_memory_tb.v

fast_memory_program: final/fast_memory_tb.v
	iverilog -o final/fast_memory -D PROGRAM_FROM_FILE final/fast_memory_tb.v

fast_rom: final/fast_rom_tb.v
	iverilog -o final/fast_rom final/fast_rom_tb.v

fast_rom_program: final/fast_rom_tb.v
	iverilog -o final/fast_rom -D PROGRAM_FROM_FILE final/fast_rom_tb.v

clean:
	rm -f basics/and_gate basics/not_gate basics/or_gate basics/xor_gate basics/mux_gate basics/dmux_gate basics/not16 basics/and16 basics/mux16 basics/or8way basics/dmux8way basics/dmux4way basics/mux8way16 
	rm -f circuits/add16 circuits/full_adder circuits/half_adder circuits/alu circuits/inc16 
	rm -f memory/bit memory/register memory/ram8 memory/ram64 memory/ram512 memory/pc
	rm -f final/fast_memory final/fast_rom
	rm -rf *.vcd
