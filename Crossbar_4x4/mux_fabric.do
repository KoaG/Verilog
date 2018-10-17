vlog mux.v
vlog decoder.v
vlog dest_decoder.v
vlog mux_sel_gen.v
vlog mux_matrix.v
vlog prior_encoder.v
vlog mux_fabric.v

vsim -novopt mux_fabric

add wave *
force ip0pld 8'ha1
force ip1pld 8'ha2
force ip2pld 8'ha3
force ip3pld 8'ha4

force ip0d 2'b11
force ip1d 2'b11
force ip2d 2'b11
force ip3d 2'b11

force ip0s 2'b00
force ip1s 2'b01
force ip2s 2'b10
force ip3s 2'b11

force ip0v 1'b1
force ip1v 1'b1
force ip2v 1'b1
force ip3v 1'b1

force slot 2'b00
run

force ip0pld 8'hb1
force ip1pld 8'hb2
force ip2pld 8'hb3
force ip3pld 8'hb4

force ip0d 2'b10
force ip1d 2'b10
force ip2d 2'b10
force ip3d 2'b10

force ip0s 2'b01
force ip1s 2'b10
force ip2s 2'b11
force ip3s 2'b00

force ip0v 1'b1
force ip1v 1'b1
force ip2v 1'b1
force ip3v 1'b1

force slot 2'b01
run

force ip0pld 8'hc1
force ip1pld 8'hc2
force ip2pld 8'hc3
force ip3pld 8'hc4

force ip0d 2'b01
force ip1d 2'b01
force ip2d 2'b01
force ip3d 2'b01

force ip0s 2'b10
force ip1s 2'b11
force ip2s 2'b00
force ip3s 2'b01

force ip0v 1'b1
force ip1v 1'b1
force ip2v 1'b1
force ip3v 1'b1

force slot 2'b10
run

force ip0pld 8'hd1
force ip1pld 8'hd2
force ip2pld 8'hd3
force ip3pld 8'hd4

force ip0d 2'b00
force ip1d 2'b00
force ip2d 2'b00
force ip3d 2'b00

force ip0s 2'b11
force ip1s 2'b00
force ip2s 2'b01
force ip3s 2'b10

force ip0v 1'b1
force ip1v 1'b1
force ip2v 1'b1
force ip3v 1'b1

force slot 2'b11
run