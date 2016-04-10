echo Downloading glance image.
IMAGE_URL=http://download.cirros-cloud.net/0.3.4/
IMAGE=cirros-0.3.4-x86_64-disk.img
if ! [ -f "$IMAGE" ]; then
    curl -L -o ./$IMAGE $IMAGE_URL/$IMAGE
fi
echo Creating glance image.
glance image-create --name cirros --progress --disk-format qcow2 --container-format bare --progress --file ./$IMAGE
