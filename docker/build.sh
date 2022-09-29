# build the container
ARCH="$(uname -m)"

if [ "$ARCH" == "aarch64" ]
then
BASE_IMAGE=nvcr.io/nvidia/deepstream-l4t:6.1.1-triton
else
BASE_IMAGE=nvcr.io/nvidia/deepstream:6.1.1-triton
fi

sudo docker build --build-arg BASE_IMAGE=$BASE_IMAGE -t deepstream-metamux -f Dockerfile .

