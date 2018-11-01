vlog ha.v
vlog fa.v
vlog comp4to3.v

vlog vedic_3.v
#vsim -novopt vedic_3

#add wave *
#force {b[0]} 1,0 {20} -r 40
#force {b[1]} 1,0 {40} -r 80
#force {b[2]} 1,0 {80} -r 160

#force {a[0]} 1,0 {160} -r 320
#force {a[1]} 1,0 {320} -r 640
#force {a[2]} 1,0 {640} -r 1280

#run 1500