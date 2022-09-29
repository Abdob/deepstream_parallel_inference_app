xhost +
# run the container
sudo docker run \
    --runtime nvidia -it --rm --network host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix/:/tmp/.X11-unix \
    -v $XAUTH:$XAUTH -e XAUTHORITY=$XAUTH \
    -v $(pwd):/home \
    deepstream-metamux