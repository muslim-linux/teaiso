#!/bin/bash
apt update
apt install xorriso grub-pc-bin grub-efi mtools make python3 \
    dosfstools e2fsprogs squashfs-tools python3-yaml git \
    gcc wget curl unzip xz-utils zstd debootstrap -y
git clone https://gitlab.com/tearch-linux/applications-and-tools/teaiso
cd teaiso
make && make install
cd ../
mkteaiso --profile=./muslim --output=/output/ --debug 2>&1
