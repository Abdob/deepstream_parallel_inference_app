gst-launch-1.0 uridecodebin uri=file:///opt/nvidia/deepstream/deepstream-6.1/samples/streams/sample_1080p_h264.mp4 ! \
m.sink_0 nvstreammux width=1920 height=1080 batch-size=1 name=m ! \
queue ! \
nvinferserver batch-size=1 config-file-path=/home/tritonclient/sample/configs/trafficcamnet/config_trafficcamnet_inferserver.txt ! \
nvtracker tracker-width=640 tracker-height=384 ll-lib-file=/opt/nvidia/deepstream/deepstream/lib/libnvds_nvmultiobjecttracker.so  \
ll-config-file=/opt/nvidia/deepstream/deepstream-6.1/samples/configs/deepstream-app/config_tracker_NvDCF_perf.yml \
enable-batch-process=1 enable-past-frame=1 display-tracking-id=1 ! \
nvdsanalytics config-file=/home/tritonclient/sample/configs/apps/vehicle_tracking/config_nvdsanalytics.txt ! \
nvvideoconvert ! \
nvdsosd ! \
tee name=t ! \
queue ! \
nveglglessink sync=0 t. ! \
queue ! \
nvmsgconv config=/home/tritonclient/sample/configs/apps/bodypose_yolo_lpr/dstest5_msgconv_sample_config.yml \
msg2p-lib=/opt/nvidia/deepstream/deepstream/lib/libnvds_msgconv.so payload-type=0 ! fakesink
