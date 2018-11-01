do vedic12.do
vlog add1_11b.v
vlog adder_24.v
vlog vedic_24.v
vlog vedic_24_tb.v

vsim -novopt vedic_24_tb
add wave *

run -all