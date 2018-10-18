#generating input port data

file = open('testcase.txt','w')

idx = [0,15,30,45]
slots = ['000','001','010','011']

def print_input_slots(ip_list) :
	print ("SLOT0 \t SLOT1 \t SLOT2 \t SLOT3")
	for i in range(4) :
		print(format(int(ip_list[i][0:15],2),'04x'),
			format(int(ip_list[i][15:30],2),'04x'),
			format(int(ip_list[i][30:45],2),'04x'),
			format(int(ip_list[i][45:60],2),'04x'))		

def print_output_slots(mem) :
	print ("SLOT0 SLOT1 SLOT2 SLOT3")
	for i in mem :
		print(format(int(i[0],2),'04x'),
			format(int(i[1],2),'04x'),
			format(int(i[2],2),'04x'),
			format(int(i[3],2),'04x'))

def gen_output(ip,port,slot,mem) :
	if(ip[0] == '1') :
		mem = ip[0] + port + slot + ip[7:]
	return mem

def get_outputs(i0,i1,i2,i3):
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



ip0 = format(0x43A1,'015b')+format(0x4AB1,'015b')+format(0x51C1,'015b')+format(0x58D1,'015b')
ip1 = format(0x4BA2,'015b')+format(0x52B2,'015b')+format(0x59C2,'015b')+format(0x40D2,'015b')
ip2 = format(0x53A3,'015b')+format(0x5AB3,'015b')+format(0x41C3,'015b')+format(0x48D3,'015b')
ip3 = format(0x5BA4,'015b')+format(0x42B4,'015b')+format(0x49C4,'015b')+format(0x50D4,'015b')
print_input_slots([ip0,ip1,ip2,ip3])
get_outputs(ip0,ip1,ip2,ip3)

ip0 = format(0x43A1,'015b')+format(0x43B1,'015b')+format(0x43C1,'015b')+format(0x43D1,'015b')
ip1 = format(0x43A2,'015b')+format(0x43B2,'015b')+format(0x43C2,'015b')+format(0x43D2,'015b')
ip2 = format(0x43A3,'015b')+format(0x43B3,'015b')+format(0x43C3,'015b')+format(0x43D3,'015b')
ip3 = format(0x43A4,'015b')+format(0x43B4,'015b')+format(0x43C4,'015b')+format(0x43D4,'015b')
print_input_slots([ip0,ip1,ip2,ip3])
get_outputs(ip0,ip1,ip2,ip3)

ip0 = format(0x43A1,'015b')+format(0x43B1,'015b')+format(0x43C1,'015b')+format(0x43D1,'015b')
ip1 = format(0x43A2,'015b')+format(0x43B2,'015b')+format(0x43C2,'015b')+format(0x43D2,'015b')
ip2 = format(0x43A3,'015b')+format(0x43B3,'015b')+format(0x43C3,'015b')+format(0x43D3,'015b')
ip3 = format(0x43A4,'015b')+format(0x43B4,'015b')+format(0x43C4,'015b')+format(0x43D4,'015b')
print_input_slots([ip0,ip1,ip2,ip3])
get_outputs(ip0,ip1,ip2,ip3)

ip0 = format(0x40A1,'015b')+format(0x41B1,'015b')+format(0x42C1,'015b')+format(0x43D1,'015b')
ip1 = format(0x40A2,'015b')+format(0x41B2,'015b')+format(0x42C2,'015b')+format(0x43D2,'015b')
ip2 = format(0x40A3,'015b')+format(0x41B3,'015b')+format(0x42C3,'015b')+format(0x43D3,'015b')
ip3 = format(0x40A4,'015b')+format(0x41B4,'015b')+format(0x42C4,'015b')+format(0x43D4,'015b')
print_input_slots([ip0,ip1,ip2,ip3])
get_outputs(ip0,ip1,ip2,ip3)

ip0 = format(0x40A1,'015b')+format(0x01B1,'015b')+format(0x02C1,'015b')+format(0x43D1,'015b')
ip1 = format(0x00A2,'015b')+format(0x41B2,'015b')+format(0x02C2,'015b')+format(0x43D2,'015b')
ip2 = format(0x40A3,'015b')+format(0x01B3,'015b')+format(0x42C3,'015b')+format(0x03D3,'015b')
ip3 = format(0x00A4,'015b')+format(0x41B4,'015b')+format(0x42C4,'015b')+format(0x03D4,'015b')
print_input_slots([ip0,ip1,ip2,ip3])
get_outputs(ip0,ip1,ip2,ip3)




	
'''	
for i in range(2**5) :
	for j in range(2**5) :
		for k in range(2**5) :	
			for l in range(2**5) :
				ds0 = format(i,'05b')
				ds1 = format(j,'05b')
				ds2 = format(k,'05b')
				ds3 = format(l,'05b')
				i0 = ds0[0] + '0' + ds1[1:3] + '0' + ds1[3:5]
				s = i0 + '\n' + i1 + '\n' + i2 + '\n' + i3
				get_outputs(i0,i1,i2,i3)
				file.write(s+'\n')
'''
file.close()
