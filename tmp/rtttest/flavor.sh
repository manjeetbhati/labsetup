#!/bin/sh

#preparation
glance image-create --name="centos-7-1603"   --container-format=bare --disk-format=qcow2 < /tmp/CentOS-7-x86_64-GenericCloud-1603.qcow2c

nova keypair-add frt >~/tmp/frt.pem
chmod 600 ~/tmp/frt.pem
scp ~/tmp/frt.pem  stack@172.23.0.83:~/tmp/

nova aggregate-create realtime
nova aggregate-set-metadata realtime rt=true
nova aggregate-create nonrealtime
nova aggregate-set-metadata nonrealtime rt=false
nova aggregate-add-host realtime  manjeet86150


nova flavor-create m1.realtime 10 2048 20 4
nova flavor-key m1.realtime set hw:cpu_policy=dedicated
nova flavor-key m1.realtime set hw:cpu_thread_policy=isolate
nova flavor-key m1.realtime set hw:cpu_realtime_mask=^0
nova flavor-key m1.realtime set hw:cpu_realtime=yes
nova flavor-key m1.realtime set hw:mem_page_size=1GB
nova flavor-key m1.realtime set aggregate_instance_extra_specs:rt=true


#nova boot --image centos-7-1603 --flavor m1.medium --nic net-id=7b1623d5-86f7-4256-a535-61ca9b61072a  --security-groups default --key-name frt frt
