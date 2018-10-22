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
        for i0s0 in range(2**5) :
                temp0 = format(i0s0,'05b')
                i0s0i = '0' + temp0[0] + '0' + temp0[1:3] + '0' + temp0[3:5] + pyl_i0s0
                for i0s1 in range(2**5) :
                        temp1 = format(i0s1,'05b')
                        i0s1i = '0' + temp1[0] + '0' + temp1[1:3] + '0' + temp1[3:5] + pyl_i0s1
                        for i0s2 in range(2**5) :
                                temp2 = format(i0s2,'05b')
                                i0s2i = '0' + temp2[0] + '0' + temp2[1:3] + '0' + temp2[3:5] + pyl_i0s2
                                for i0s3 in range(2**5) :
                                        temp3 = format(i0s3,'05b')
                                        i0s3i = '0' + temp3[0] + '0' + temp3[1:3] + '0' + temp3[3:5] + pyl_i0s3
                                        file.write(format(int(i0s0i+i0s1i+i0s2i+i0s3i,2),'016x')+'\n')
                                        file.write(i1 + '\n')
                                        file.write(i2 + '\n')
                                        file.write(i3 + '\n')

def get_iport1(i2,i3):
        for i1s0 in range(2**5) :
                temp0 = format(i1s0,'05b')
                i1s0i = '0' + temp0[0] + '0' + temp0[1:3] + '0' + temp0[3:5] + pyl_i1s0
                for i1s1 in range(2**5) :
                        temp1 = format(i1s1,'05b')
                        i1s1i = '0' + temp1[0] + '0' + temp1[1:3] + '0' + temp1[3:5] + pyl_i1s1
                        for i1s2 in range(2**5) :
                                temp2 = format(i1s2,'05b')
                                i1s2i = '0' + temp2[0] + '0' + temp2[1:3] + '0' + temp2[3:5] + pyl_i1s2
                                for i1s3 in range(2**5) :
                                        temp3 = format(i1s3,'05b')
                                        i1s3i = '0' + temp3[0] + '0' + temp3[1:3] + '0' + temp3[3:5] + pyl_i1s3
                                        get_iport0(format(int(i1s0i+i1s1i+i1s2i+i1s3i,2),'016x'),i2,i3)

def get_iport2(i3):
        for i2s0 in range(2**5) :
                temp0 = format(i2s0,'05b')
                i2s0i = '0' + temp0[0] + '0' + temp0[1:3] + '0' + temp0[3:5] + pyl_i2s0
                for i2s1 in range(2**5) :
                        temp1 = format(i2s1,'05b')
                        i2s1i = '0' + temp1[0] + '0' + temp1[1:3] + '0' + temp1[3:5] + pyl_i2s1
                        for i2s2 in range(2**5) :
                                temp2 = format(i2s2,'05b')
                                i2s2i = '0' + temp2[0] + '0' + temp2[1:3] + '0' + temp2[3:5] + pyl_i0s2
                                for i2s3 in range(2**5) :
                                        temp3 = format(i2s3,'05b')
                                        i2s3i = '0' + temp3[0] + '0' + temp3[1:3] + '0' + temp3[3:5] + pyl_i2s3
                                        get_iport1(format(int(i2s0i+i2s1i+i2s2i+i2s3i,2),'016x'),i3)

def get_iport3():
        for i3s0 in range(2**5) :
                temp0 = format(i3s0,'05b')
                i3s0i = '0' + temp0[0] + '0' + temp0[1:3] + '0' + temp0[3:5] + pyl_i3s0
                for i3s1 in range(2**5) :
                        temp1 = format(i3s1,'05b')
                        i3s1i = '0' + temp1[0] + '0' + temp1[1:3] + '0' + temp1[3:5] + pyl_i3s1
                        for i3s2 in range(2**5) :
                                temp2 = format(i3s2,'05b')
                                i3s2i = '0' + temp2[0] + '0' + temp2[1:3] + '0' + temp2[3:5] + pyl_i3s2
                                for i3s3 in range(2**5) :
                                        temp3 = format(i3s3,'05b')
                                        i3s3i = '0' + temp3[0] + '0' + temp3[1:3] + '0' + temp3[3:5] + pyl_i3s3
                                        get_iport2(format(int(i3s0i+i3s1i+i3s2i+i3s3i,2),'016x'))


file = open("test_cases.txt","w")
get_iport3()
file.close()