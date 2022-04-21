#!/usr/bin/env bash

repo_path=$(pwd)
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
sudo meson setup build .
sudo ninja -C build
sudo ninja -C build install

sudo mkdir /etc/mavlink-router/
cd $repo_path
sudo cp main.conf /etc/mavlink-router/main.conf

# enable service at startup and start for current session
sudo systemctl enable mavlink-router.service
