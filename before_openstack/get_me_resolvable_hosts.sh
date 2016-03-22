#!/bin/bash

first_8_bits=172
second_8_bits=23
third_8_bits=0
fourth_8_bits=86
hostid=86153
local_ip=127.0.0.1

IP_addr=$first_8_bits.$second_8_bits.$third_8_bits.$fourth_8_bits

echo $local_ip  'localhost'

until [ $fourth_8_bits -lt 24 ]; do
    IP_addr=$first_8_bits.$second_8_bits.$third_8_bits.$fourth_8_bits
    echo $IP_addr  'manjeet'$hostid'.local.lan' 'manjeet'$hostid
    ((fourth_8_bits--))
    ((hostid--))
done

    echo '::1     localhost ip6-localhost ip6-loopback'
    echo 'ff02::1 ip6-allnodes'
    echo 'ff02::2 ip6-allrouters'

