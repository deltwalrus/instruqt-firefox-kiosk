#!/bin/bash

# Clean up any existing lock files for display :99
rm -f /tmp/.X99-lock

# Ensure necessary directories for xpra exist
mkdir -p /run/xpra

# Set XDG_RUNTIME_DIR environment variable and permissions
export XDG_RUNTIME_DIR=/run/user/0
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR

# Stop any existing Xvfb instances
if pgrep Xvfb; then
    echo "Stopping existing Xvfb instances"
    pkill Xvfb
fi

# Start Xvfb (X virtual framebuffer)
Xvfb :99 -screen 0 1920x1080x24 &

# Wait for Xvfb to initialize
sleep 5

# Start xpra in HTML5 mode without unnecessary features
XPRA_FORCE_REPLACE_WM=1 xpra start :99 \
    --bind-tcp=0.0.0.0:8080 \
    --html=on \
    --start-child=xterm \
    --exit-with-children \
    --daemon=no \
    --no-pulseaudio \
    --no-webcam \
    --socket-dir=/run/xpra

# Start Firefox in kiosk mode with the provided URL or default
firefox --kiosk "${START_URL}" &

# Keep the container running

