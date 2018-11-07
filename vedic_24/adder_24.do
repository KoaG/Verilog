vlog cla_4bit_0.v
vlog csa_4bit.v
vlog adder_24.v

vlog adder_24_tb.v
vsim -novopt adder_24_tb

add wave *
run -all