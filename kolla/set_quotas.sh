#!/bin/bash
# Get admin user and tenant IDs
ADMIN_USER_ID=$(openstack user list | awk '/ admin / {print $2}')
ADMIN_PROJECT_ID=$(openstack project list | awk '/ admin / {print $2}')

# 40 instances
nova quota-update --instances 70000 $ADMIN_PROJECT_ID
nova quota-update --user $ADMIN_USER_ID --instances 70000 $ADMIN_PROJECT_ID

# 40 cores
nova quota-update --cores 2390 $ADMIN_PROJECT_ID
nova quota-update --user $ADMIN_USER_ID --cores 2390 $ADMIN_PROJECT_ID

# 96GB ram
nova quota-update --ram 12200000 $ADMIN_PROJECT_ID
nova quota-update --user $ADMIN_USER_ID --ram 12200000 $ADMIN_PROJECT_ID

# ports
neutron quota-update --port 70000 --floatingip 70000 --network 2000 --router 300 --security_group 1000 --security_group_rule 10000 --subnet 3000
