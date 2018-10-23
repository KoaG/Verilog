vlog mux.v
vlog decoder.v
vlog dest_decoder.v
vlog mux_sel_gen.v
vlog mux_matrix.v
vlog prior_encoder.v
vlog mux_fabric.v
vlog switch.v

vlog ROM_mem_file_in.v
vlog ROM_mem_file_out.v
vlog memory_controller.v
vlog memory_controller_output.v

vlog crossbar_driver.v
vlog crossbar_driver_tb.v

vsim -novopt crossbar_driver_tb

add wave *
add wave /cd/crossbar/start
add wave /cd/crossbar/ready
add wave /cd/*
add wave /cd/crossbar/iport*
add wave /cd/crossbar/oport*
config wave -signalnamewidth 1


run 2000