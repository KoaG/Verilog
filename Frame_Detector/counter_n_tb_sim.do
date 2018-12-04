vlog counter_n.v
vlog counter_n_tb.v

vsim -novopt counter_n_tb

add wave *
run -all