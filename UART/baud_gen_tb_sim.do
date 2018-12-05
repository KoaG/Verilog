vlog baud_gen.v
vlog baud_gen_tb.v

vsim -novopt baud_gen_tb

add wave *
run -all