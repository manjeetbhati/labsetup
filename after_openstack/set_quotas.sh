# Get admin user and tenant IDs
ADMIN_USER_ID=$(openstack user list | awk '/ admin / {print $2}')
ADMIN_PROJECT_ID=$(openstack project list | awk '/ admin / {print $2}')

# 40 instances
nova quota-update --instances 20000 $ADMIN_PROJECT_ID
nova quota-update --user $ADMIN_USER_ID --instances 20000 $ADMIN_PROJECT_ID

# 40 cores
nova quota-update --cores 2600 $ADMIN_PROJECT_ID
nova quota-update --user $ADMIN_USER_ID --cores 2600 $ADMIN_PROJECT_ID

# 96GB ram
nova quota-update --ram 13000000 $ADMIN_PROJECT_ID
nova quota-update --user $ADMIN_USER_ID --ram 13000000 $ADMIN_PROJECT_ID
