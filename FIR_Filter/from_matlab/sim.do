onbreak resume
onerror resume
vsim -novopt my_Filt_tb
add wave sim:/my_Filt_tb/u_filter/clk
add wave sim:/my_Filt_tb/u_filter/ce
add wave sim:/my_Filt_tb/u_filter/rst
add wave sim:/my_Filt_tb/u_filter/x
add wave sim:/my_Filt_tb/u_filter/y
add wave sim:/my_Filt_tb/filter_out_ref
run -all
