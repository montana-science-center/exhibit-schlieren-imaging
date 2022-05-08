#!/bin/bash
# Schlieren imaging setup script

# Set the rpi to boot to the console and login automatically
sudo raspi-config nonint do_boot_behaviour B2

# Enable Glamor graphics acceleration so libcamera apps work
sudo raspi-config nonint do_glamor 1

# Set GPU memory to 128 MB; I'm not sure if this is necessary, but it doesn't hurt.
sudo raspi-config nonint do_memory_split 128

# Copy the launch script into our home directory
cp run-camera.sh ~/

# Setup the systemd service
mkdir -p ~/.local/share/systemd/user
cp camera.service ~/.local/share/systemd/user/camera.service
systemctl enable --user camera.service
