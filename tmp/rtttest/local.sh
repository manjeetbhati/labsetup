#!/bin/bash

for i in `seq 2 10`; do nova fixed-ip-reserve 10.4.128.$i; done


