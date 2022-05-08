# MSC Schlieren Imaging Exhibit

## Raspberry pi camera setup
The Rapsberry pi camera is set to stream video to a fullscreen framebuffer on boot. A systemd user service, `camera.service`, launches the `run-camera.sh` script, which runs `libcamera-vid`.

### Prerequisites
- An SD card image running Raspberry pi OS 64-bit, based on Debian version 11 (bullseye). Newer versions of Debian should work fine; the main thing is that `libcamera` is installed.
- On Debian bullseye, you need to enable Glamor graphics acceleration, otherweise the camera stream won't work. Enable this by running `sudo raspi-config`, then enable `Glamor` under `Advanced Options`.

### Installation
1. Copy `run-camera.sh` to `/home/msc/run-camera.sh` on the raspberry pi
2. Make a directory for user systemd units: `mkdir -p /home/msc/.local/...`
3. Copy `camera.service` to `...`
4. Enable the systemd service: `systemctl enable --user camera.service`
5. Using raspi-config, set the raspberry pi to boot to the CLI instead of the desktop. This allows `libcamera-vid` to make a borderless fullscreen stream by directly using the framebuffer. Doing this makes it so no mouser pointers or anything show up in the video stream.

### Killing the camera stream
Since `libcamera-vid` is directly taking over the framebuffer (display), we can't easily kill the video stream. The easiest way to kill the video is to type `killall libcamera-vid`; unless you are ssh'd into the raspberry pi (ssh isn't enabled by default), you have to type that command blindly since the video is filling the screen.



### References
- [raspberry pi camera documentation](https://www.raspberrypi.com/documentation/accessories/camera.html)

