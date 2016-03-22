#!/bin/bash

if [ $# -ne 1 ]; then
        echo "Need the vm_count as input"
        exit 1
fi

vm_count=$1
echo "vm count is $vm_count"
# Expand this to see if you can start the openstack server create command
# echo $(setsid openstack server list | grep ACTIVE | wc -l)

time nova boot --flavor m1.tiny  --image cirros --nic net-id=`neutron net-list | grep demo | awk '{print $2}'` --security-group default --max-count $vm_count test

start_time=$(date +%s)
echo "Start Time:" $start_time
while [ $(nova list | grep ACTIVE | wc -l) -lt $vm_count ]
do
        sleep 1
done
end_time=$(date +%s)
echo "End TIme:" $end_time
echo $((end_time - start_time)) | awk '{print int($1/60)":" int($1%60)}'
