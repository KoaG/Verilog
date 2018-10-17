vlog mux.v
vlog decoder.v
vlog dest_decoder.v
vlog mux_sel_gen.v
vlog mux_matrix.v
vlog prior_encoder.v
vlog mux_fabric.v

vlog switch.v
vsim switch

add wave *

force clk 1,0 {50} -r 100
force rst 1
force start 0
force iport0 15'd0
force iport1 15'd0
force iport2 15'd0
force iport3 15'd0
run

force rst 0 30
run

force start 1 30
force iport0 15'h43a1 60
force iport1 15'h4ba2 60
force iport2 15'h53a3 60
force iport3 15'h5ba4 60
run 

force start 0 30
force iport0 15'h4ab1 60
force iport1 15'h52b2 60
force iport2 15'h5ab3 60
force iport3 15'h42b4 60
run

force iport0 15'h51c1 60
force iport1 15'h59c2 60
force iport2 15'h41c3 60
force iport3 15'h49c4 60
run

force iport0 15'h58d1 60
force iport1 15'h40d2 60
force iport2 15'h48d3 60
force iport3 15'h50d4 60
run 600
force start 0
force iport0 15'h43a1
force iport1 15'h43a2
force iport2 15'h43a3
force iport3 15'h43a4
run

force rst 0 30
run

force start 1 30
run 

force start 0 30
force iport0 15'h43b1 30
force iport1 15'h43b2 30
force iport2 15'h43b3 30
force iport3 15'h43b4 30
run

force iport0 15'h43c1 30
force iport1 15'h43c2 30
force iport2 15'h43c3 30
force iport3 15'h43c4 30
run

force iport0 15'h43d1 30
force iport1 15'h43d2 30
force iport2 15'h43d3 30
force iport3 15'h43d4 30
run 600

force start 1 30
force iport0 15'h43a1 30
force iport1 15'h4ba2 30
force iport2 15'h53a3 30
force iport3 15'h5ba4 30
run 

force start 0 30
force iport0 15'h4ab1 30
force iport1 15'h52b2 30
force iport2 15'h5ab3 30
force iport3 15'h42b4 30
run

force iport0 15'h51c1 30
force iport1 15'h59c2 30
force iport2 15'h41c3 30
force iport3 15'h49c4 30
run

force iport0 15'h58d1 30
force iport1 15'h40d2 30
force iport2 15'h48d3 30
force iport3 15'h50d4 30
run 600

force start 1 30
force iport0 15'h40a1 30
force iport1 15'h40a2 30
force iport2 15'h40a3 30
force iport3 15'h40aa 30
run 

force start 0 30
force iport0 15'h41b1 30
force iport1 15'h41b2 30
force iport2 15'h41b3 30
force iport3 15'h41bb 30
run

force iport0 15'h42c1 30
force iport1 15'h42c2 30
force iport2 15'h42c3 30
force iport3 15'h42cc 30
run

force iport0 15'h43d1 30
force iport1 15'h43d2 30
force iport2 15'h43d3 30
force iport3 15'h43dd 30
run 600

force start 1 30
force iport0 15'h40a1 30
force iport1 15'h00a2 30
force iport2 15'h40a0 30
force iport3 15'h00aa 30
run 

force start 0 30
force iport0 15'h01b1 30
force iport1 15'h41b2 30
force iport2 15'h01b3 30
force iport3 15'h41a1 30
run

force iport0 15'h42c1 30
force iport1 15'h42a2 30
force iport2 15'h02c3 30
force iport3 15'h02cc 30
run

force iport0 15'h43a3 30
force iport1 15'h03d2 30
force iport2 15'h03d3 30
force iport3 15'h03dd 30
run 600


force start 1 30
force iport0 15'h40aa 80
force iport1 15'h00a2 80
force iport2 15'h00a0 80
force iport3 15'h00aa 80
run 

force start 0 30
force iport0 15'h49b1 80
force iport1 15'h49bb 80
force iport2 15'h09b3 80
force iport3 15'h09a1 80
run

force iport0 15'h52c1 80
force iport1 15'h52a2 80
force iport2 15'h52cc 80
force iport3 15'h02cc 80
run

force iport0 15'h5ba3 80
force iport1 15'h5bd2 80
force iport2 15'h5bd3 80
force iport3 15'h5bdd 80
run 600