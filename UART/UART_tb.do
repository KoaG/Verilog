vlog baud_gen.v
vlog UART_RX.v
vlog UART_TX.v
vlog UART.v
vlog UART_tb.v

vsim -novopt UART_tb

add wave *
run -all