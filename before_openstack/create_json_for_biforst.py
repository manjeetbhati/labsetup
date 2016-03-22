import json
import uuid

HOST_ID = 86090
HOST_NAME = 'manjeet'

def create_json(ilo_ip, mac_addr):
    data = {
         "uuid" : str(uuid.uuid4()),
         "driver_info": {
           "power" : {
             "ipmi_transit_address": "null",
      	     "ipmi_target_channel": "null", 
             "ipmi_transit_channel": "null",
             "ipmi_username": "root",
             "ipmi_address": ilo_ip, 
             "ipmi_target_address": "null",
             "ipmi_password": "calvincalvin"
      }
    },
    "nics": [
      {
        "mac": str(mac_addr)
      }
    ],
    "driver": "agent_ipmitool", 
    "name": HOST_NAME+str(HOST_ID), 
    "ipv4_address": "null", 
    "addressing_mode": "dhcp", 
    "properties": {
    "cpu_arch": "x86_64", 
    "ram": "262100", 
    "disk_size": "2500", 
    "cpus": "12"
      }, 
      "provisioning_ipv4_address": "null"
    }
   
    return data


def main():
    global HOST_ID
    global HOST_NAME
    data= {}
    with open('all_macs.txt', 'r') as file_mac:
        for line in file_mac:
	    line = line.rstrip()
            split_line = line.split(' ')
            data_obj = create_json(split_line[0], split_line[1])            
            data[HOST_NAME+str(HOST_ID)] = data_obj
            HOST_ID = HOST_ID + 1
    with open("bifrost.json", 'wb') as handle:
        json.dump(data, handle, indent=4, separators=(',', ': '))

if __name__ == "__main__":
    main()
