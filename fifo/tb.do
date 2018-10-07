vlog sync_FIFO.v
vlog tb.v

vsim -novopt tb

add wave *
add wave /tb/fifo1/rd_ptr
add wave /tb/fifo1/wr_ptr
add wave /tb/fifo1/data_count
add wave /tb/fifo1/fifo

run 3000
