vlog baud_gen.v
vlog UART_TX.v
vlog UART_TX_tb.v

vsim -novopt UART_TX_tb

add wave sim:/UART_TX_tb/sclr
add wave sim:/UART_TX_tb/sclk
add wave sim:/UART_TX_tb/umode
add wave sim:/UART_TX_tb/smode
add wave sim:/UART_TX_tb/bmode
add wave sim:/UART_TX_tb/tx
add wave sim:/UART_TX_tb/uut/BCLK
add wave sim:/UART_TX_tb/uut/samples
add wave sim:/UART_TX_tb/uut/count
add wave sim:/UART_TX_tb/uut/DATA
add wave sim:/UART_TX_tb/tx_en
add wave sim:/UART_TX_tb/tx_data
add wave sim:/UART_TX_tb/uut/tx_ps
add wave sim:/UART_TX_tb/uut/tx_ns

run -all