from random import randint as rand
l = [0x00,0x01,0x02,0x03,0x08,0x09,0x0A,0x0B,
     0x10,0x11,0x12,0x13,0x18,0x19,0x1A,0x1B,
     0x40,0x41,0x42,0x43,0x48,0x49,0x4A,0x4B,
     0x50,0x51,0x52,0x53,0x58,0x59,0x5A,0x5B]

rl = 0
rh = 31

pyl_i0s0 = format(0xA1,'08b')
pyl_i0s1 = format(0xA2,'08b')
pyl_i0s2 = format(0xA3,'08b')
pyl_i0s3 = format(0xA4,'08b')
pyl_i1s0 = format(0xB1,'08b')
pyl_i1s1 = format(0xB2,'08b')
pyl_i1s2 = format(0xB3,'08b')
pyl_i1s3 = format(0xB4,'08b')
pyl_i2s0 = format(0xC1,'08b')
pyl_i2s1 = format(0xC2,'08b')
pyl_i2s2 = format(0xC3,'08b')
pyl_i2s3 = format(0xC4,'08b')
pyl_i3s0 = format(0xD1,'08b')
pyl_i3s1 = format(0xD2,'08b')
pyl_i3s2 = format(0xD3,'08b')
pyl_i3s3 = format(0xD4,'08b')

def get_iport0(i1,i2,i3):
	r = rand(rl,rh)
        i0s0i = str(format(l[r],'08b')) + pyl_i0s0
        r = rand(rl,rh) 
        i0s1i = str(format(l[r],'08b')) + pyl_i0s1
        r = rand(rl,rh)
        i0s2i = str(format(l[r],'08b')) + pyl_i0s2
        r = rand(rl,rh)
        i0s3i = str(format(l[r],'08b')) + pyl_i0s3
        file.write(format(int(i0s0i+i0s1i+i0s2i+i0s3i,2),'016x')+'\n')
        file.write(i1 + '\n')
        file.write(i2 + '\n')
        file.write(i3 + '\n')

def get_iport1(i2,i3):
        r = rand(rl,rh)
        i1s0i = str(format(l[r],'08b')) + pyl_i1s0
        r = rand(rl,rh)
        i1s1i = str(format(l[r],'08b')) + pyl_i1s1
        r = rand(rl,rh)
        i1s2i = str(format(l[r],'08b')) + pyl_i1s2
        r = rand(rl,rh)
        i1s3i = str(format(l[r],'08b')) + pyl_i1s3
        get_iport0(format(int(i1s0i+i1s1i+i1s2i+i1s3i,2),'016x'),i2,i3)

def get_iport2(i3):
	r = rand(rl,rh)
        i2s0i = str(format(l[r],'08b')) + pyl_i2s0
        r = rand(rl,rh)
        i2s1i = str(format(l[r],'08b')) + pyl_i2s1
        r = rand(rl,rh)
        i2s2i = str(format(l[r],'08b')) + pyl_i0s2
        r = rand(rl,rh)
        i2s3i = str(format(l[r],'08b')) + pyl_i2s3
        get_iport1(format(int(i2s0i+i2s1i+i2s2i+i2s3i,2),'016x'),i3)

def get_iport3():
	r = rand(rl,rh)
        i3s0i = str(format(l[r],'08b')) + pyl_i3s0
        r = rand(rl,rh)
        i3s1i = str(format(l[r],'08b')) + pyl_i3s1
        r = rand(rl,rh)
        i3s2i = str(format(l[r],'08b')) + pyl_i3s2
        r = rand(rl,rh)
        i3s3i = str(format(l[r],'08b')) + pyl_i3s3
        get_iport2(format(int(i3s0i+i3s1i+i3s2i+i3s3i,2),'016x'))


file = open("test_cases.txt","w")
for i in range(256) :
	get_iport3()
file.close()
