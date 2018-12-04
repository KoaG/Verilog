vlog pattern_1010.v
vlog pattern_1010_tb.v

vsim -novopt pattern_1010_tb

add wave *
add wave sim:/pattern_1010_tb/uut/ps
add wave sim:/pattern_1010_tb/uut/ns
run -all