#!/bin/bash

# Get the size of the display's framebuffer
WIDTH=`cat /sys/class/graphics/fb0/virtual_size | cut -d, -f1`
HEIGHT=`cat /sys/class/graphics/fb0/virtual_size | cut -d, -f2`

# Run the video camera
# "-t 0" means no timeout --- the video will run forever
libcamera-vid -t 0 --width ${WIDTH} --height ${HEIGHT}

