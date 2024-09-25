# Use a lightweight Ubuntu base image
FROM ubuntu:20.04

# Set DEBIAN_FRONTEND to noninteractive to suppress prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages including XPRA
RUN apt-get update && apt-get install -y \
    firefox \
    x11vnc \
    xvfb \
    fluxbox \
    dbus-x11 \
    xterm \
    wget \
    ca-certificates \
    gnupg \
    python3-dbus \
    python3-paramiko \
    python3-pyinotify \
    python3-pil \
    python3-uinput \
    python3-netifaces \
    python3-xdg \
    procps \
    curl \
    net-tools \
    tree \
    vim-tiny \
    gstreamer1.0-vaapi \
    --no-install-recommends && \
    wget -O - https://xpra.org/gpg.asc | apt-key add - && \
    echo "deb https://xpra.org/ focal main" > /etc/apt/sources.list.d/xpra.list && \
    apt-get update && \
    apt-get install -y xpra && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV DISPLAY=:99
ENV XPRA_HTML=on
ENV XPRA_XVFB=on
ENV START_URL=https://www.instruqt.com

# Start script
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expose the port for XPRA
EXPOSE 8080

# Set entry point
ENTRYPOINT ["/usr/local/bin/start.sh"]

