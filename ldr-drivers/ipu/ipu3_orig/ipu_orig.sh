#!/bin/sh

cd /root
insmod /ldr/ipuv3.ko
sh insCamera.sh

export LD_LIBRARY_PATH=/usr/ffmpeg/lib:/usr/xml2/lib:/usr/librtmp/lib:/usr/openssl/lib:/usr/stunnel/lib
/usr/ffmpeg/bin/ffmpeg -f video4linux2 -i /dev/video1 -pixel_format yuv420p -s 640x480 -b 300k -r 25 -g 5 -preset ultrafast -crf 20  -vcodec libx264 -x264-params "keyint=5:ref=1:no-open-gop=1:weightp=0:weightb=0:bframes=0:scenecut=0:b-adapt=0:repeat-headers=1" -f rtp rtp://10.4.122.64:1936/live/video