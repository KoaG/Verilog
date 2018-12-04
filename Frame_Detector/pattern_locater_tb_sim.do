vlog counter_n.v
vlog pattern_1010.v
vlog pattern_locater.v
vlog pattern_locater_tb.v

vsim -novopt pattern_locater_tb

add wave *
run -all