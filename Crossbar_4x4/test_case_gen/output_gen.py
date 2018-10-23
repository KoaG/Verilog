slots = ['000','001','010','011']
port = ['000','001','010','011']
idx = [0,15,30,45]
mem = [[format(0,'015b') for i in range(4)] for j in range(4)]

portI = ['IPORT0','IPORT1','IPORT2','IPORT3']
def print_input_slots(ip_list) :
	matrix = [['','SLOT0','SLOT1','SLOT2','SLOT3']]
	k = 0
        for i in range(4) :
                matrix.append([portI[k],format(int(ip_list[i][0:15],2),'04x'),
                        format(int(ip_list[i][15:30],2),'04x'),
                        format(int(ip_list[i][30:45],2),'04x'),
                        format(int(ip_list[i][45:60],2),'04x')])
	k = k + 1
	print('\n'.join(['\t'.join([str(cell) for cell in row]) for row in matrix]))

portO = ['OPORT0','OPORT1','OPORT2','OPORT3']
def print_output_slots(mem) :
	matrix = [['','SLOT0','SLOT1','SLOT2','SLOT3']]
	k = 0
        for i in mem :
                matrix.append([portO[k],format(int(i[0],2),'04x'),
                        format(int(i[1],2),'04x'),
                        format(int(i[2],2),'04x'),
                        format(int(i[3],2),'04x')])
		k = k + 1
	print('\n'.join(['\t'.join([str(cell) for cell in row]) for row in matrix]))
	matrix = matrix[1:]
	matrix = [row[1:] for row in matrix]
	file_out.write('\n'.join([''.join([str(cell) for cell in row]) for row in matrix])+'\n')

def gen_output(ip,port,slot,mem) :
        if(ip[0] == '1') :
                mem = ip[0] + port + slot + ip[7:]
        return mem

def get_outputs(i0,i1,i2,i3) :
        ip0 = [i0[i:i+15] for i in idx]
        ip1 = [i1[i:i+15] for i in idx]
        ip2 = [i2[i:i+15] for i in idx]
        ip3 = [i3[i:i+15] for i in idx]
        mem = [[format(0,'015b') for i in range(4)] for j in range(4)]
        for i in [0,1,2,3] :
                mem[int(ip0[i][1:4],2)][int(ip0[i][4:7],2)] = gen_output(ip0[i],'000',slots[i],mem[int(ip0[i][1:4],2)][int(ip0[i][4:7],2)])
                mem[int(ip1[i][1:4],2)][int(ip1[i][4:7],2)] = gen_output(ip1[i],'001',slots[i],mem[int(ip1[i][1:4],2)][int(ip1[i][4:7],2)])
                mem[int(ip2[i][1:4],2)][int(ip2[i][4:7],2)] = gen_output(ip2[i],'010',slots[i],mem[int(ip2[i][1:4],2)][int(ip2[i][4:7],2)])
                mem[int(ip3[i][1:4],2)][int(ip3[i][4:7],2)] = gen_output(ip3[i],'011',slots[i],mem[int(ip3[i][1:4],2)][int(ip3[i][4:7],2)])
	print_output_slots(mem)

file_cases = open("test_cases.txt",'r')
file_out = open("output.txt",'w')
for i in range(256) :
	#print(file.readline())
        i0 = format(int(file_cases.readline(),16),'064b')
        i1 = format(int(file_cases.readline(),16),'064b')
        i2 = format(int(file_cases.readline(),16),'064b')
        i3 = format(int(file_cases.readline(),16),'064b')
	#print(i0)
	i0 = "".join([i0[1+j*16:16+j*16] for j in range(4)])
	i1 = "".join([i1[1+j*16:16+j*16] for j in range(4)])
	i2 = "".join([i2[1+j*16:16+j*16] for j in range(4)])
	i3 = "".join([i3[1+j*16:16+j*16] for j in range(4)])
 	#print(i0)
	#print_input_slots([i0,i1,i2,i3])
        get_outputs(i0,i1,i2,i3)
file_cases.close()
file_out.close()
