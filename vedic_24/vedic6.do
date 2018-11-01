do vedic3.do
vlog cla_4bit_0.v
vlog cla_4bit_1.v
vlog csa_4bit.v
vlog add1_2b.v
vlog adder_6.v
vlog vedic_6.v

vsim -novopt vedic_6

add wave *

force {b[0]} 0,1 {20} -r 40
force {b[1]} 0,1 {40} -r 80
force {b[2]} 0,1 {80} -r 160
force {b[3]} 0,1 {160} -r 320
force {b[4]} 0,1 {320} -r 640
force {b[5]} 0,1 {640} -r 1280

force {a[0]} 0,1 {1280} -r 2560
force {a[1]} 0,1 {2560} -r 5120
force {a[2]} 0,1 {5120} -r 10240
force {a[3]} 0,1 {10240} -r 20480
force {a[4]} 0,1 {20480} -r 40960
force {a[5]} 0,1 {40960} -r 81920

run 85000