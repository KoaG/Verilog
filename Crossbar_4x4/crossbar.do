vlog mux.v
vlog decoder.v
vlog dest_decoder.v
vlog mux_sel_gen.v
vlog mux_matrix.v
vlog prior_encoder.v
vlog mux_fabric.v

vlog switch.v
vlog switch_tb.v

vsim switch_tb

add wave *
add wave /crossbar/handshake
add wave /crossbar/ps_r
add wave /crossbar/ns_r

run 3000