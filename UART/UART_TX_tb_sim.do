vlog baud_gen.v
vlog UART_TX.v
vlog UART_TX_tb.v

vsim -novopt UART_TX_tb

add wave sim:/UART_TX_tb/sclr
add wave sim:/UART_TX_tb/sclk
add wave sim:/UART_TX_tb/mode
add wave sim:/UART_TX_tb/tx_en
add wave sim:/UART_TX_tb/tx_data
add wave sim:/UART_TX_tb/tx
add wave sim:/UART_TX_tb/uut/BCLK
add wave sim:/UART_TX_tb/tx_done
add wave sim:/UART_TX_tb/uut/tx_ps
add wave sim:/UART_TX_tb/uut/tx_ns
run -all