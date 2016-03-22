#!/bin/bash

if [ $# -ne 1 ]; then
        echo "Need the vm_count as input"
        exit 1
fi

limit=$1
IP_addr="test-$limit"
until [ $limit -lt 2 ]; do
    ((limit--))
    IP_addr="$IP_addr test-$limit"
done 
     nova delete $IP_addr
