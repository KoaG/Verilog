vlog baud_gen.v
vlog UART_RX.v
vlog UART_RX_tb.v

vsim -novopt UART_RX_tb

add wave sim:/UART_RX_tb/sclr
add wave sim:/UART_RX_tb/sclk
add wave sim:/UART_RX_tb/mode
add wave sim:/UART_RX_tb/rx
add wave sim:/UART_RX_tb/uut/BCLK
add wave sim:/UART_RX_tb/uut/samples
add wave sim:/UART_RX_tb/uut/count
add wave sim:/UART_RX_tb/uut/DATA
add wave sim:/UART_RX_tb/rx_err
add wave sim:/UART_RX_tb/rx_data
add wave sim:/UART_RX_tb/uut/rx_ps
add wave sim:/UART_RX_tb/uut/rx_ns

run -all
