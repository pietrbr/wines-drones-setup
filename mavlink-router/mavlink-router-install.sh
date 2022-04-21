#!/usr/bin/env bash

sudo apt update
sudo apt install -y git python3 python3-pip

cd ~/Documents/
git clone https://github.com/intel/mavlink-router.git
cd mavlink-router
git submodule update --init --recursive

sudo apt install -y git ninja-build pkg-config gcc g++ systemd
# meson version must be > 0.55, a newer version can be installed with pip3
sudo apt purge meson
sudo pip3 install meson
meson setup build .
ninja -C build
ninja -C build install

sudo mkdir /etc/mavlink-router/
touch main.conf
sudo echo "[General]
TcpServerPort = 5760
ReportStats = false

# Specify USB serial port and Baud rate where the FCU is connected
# Check USB port with dmesg | grep tty command
[UartEndpoint uart]
Device = /dev/ttyS0
Baud = 921600, 460800, 115200

[UdpEndpoint wifi]
Mode = Normal
Address = 192.168.10.183" > main.conf

# enable service at startup and start for current session
sudo systemctl enable mavlink-router.service
sudo systemctl start mavlink-router.service
