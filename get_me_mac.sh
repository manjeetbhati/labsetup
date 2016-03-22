#!/bin/bash

first_8_bits=10
second_8_bits=15
third_8_bits=243
fourth_8_bits=6


IP_addr=$first_8_bits.$second_8_bits.$third_8_bits.$fourth_8_bits

until [ $fourth_8_bits -lt 1 ]; do
    IP_addr=$first_8_bits.$second_8_bits.$third_8_bits.$fourth_8_bits
    p4p1="$(sshpass -p calvincalvin ssh -o StrictHostKeyChecking=no root@$IP_addr show /system1/network1/Integrated_NICs | grep Port7 | cut -d '=' -f2-)"
    echo $IP_addr    $p4p1
    
    ((fourth_8_bits--))
done

