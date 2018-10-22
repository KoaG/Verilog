slots = ['000','001','010','011']
port = ['000','001','010','011']
mem = [[format(0,'015b') for i in range(4)] for j in range(4)]

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

def gen_outputs(ip,port,slot,mem) :
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

file = open("test_cases.txt",'r')
for i in range(4) :
        i0 = file.readline()
        i1 = file.readline()
        i2 = file.readline()
        i3 = file.readline()
        print_input_slots([i0,i1,i2,i3])
        print_output_slots(i0,i1,i2,i3)
file.close()