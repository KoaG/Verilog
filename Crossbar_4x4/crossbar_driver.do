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
vlog buffer.v

vlog crossbar_driver.v
vlog crossbar_driver_tb.v

vsim -novopt crossbar_driver_tb

add wave *
add wave /cd/crossbar/start
add wave /cd/crossbar/ready
add wave /cd/cen_out
add wave /cd/start_out
add wave /cd/out_data
add wave /cd/odata2
add wave /cd/odata1
add wave /cd/crossbar/iport*
add wave /cd/crossbar/oport*
config wave -signalnamewidth 1


run 2000