#!/usr/bin/env bash
cd /tmp

### Instally 17g and other stuff
apt install wget
wget https://github.com/muslim-linux/base-files/releases/download/current/base-files_9999-noupdate_amd64.deb
wget https://github.com/muslim-linux/17g-installer/releases/download/current/17g-installer_1.0_all.deb
wget https://github.com/pardus-nosystemd/desktop-base/releases/download/current/desktop-base_9999-noupdate_all.deb
wget https://github.com/muslim-linux/muslim-backgrounds/releases/download/current/muslim-backgrounds_1.0_all.deb
# install quran app
wget https://github.com/DBChoco/Muezzin/releases/download/v2.6.0/muezzin_2.6.0_amd64.deb
# fix muezzin icon
install /usr/share/icons/hicolor/0x0/apps/muezzin.png /usr/share/icons/hicolor/512x512/apps/muezzin.png

apt install ./*.deb -yq --allow-downgrades

#### Disable recommends by default
cat > /etc/apt/apt.conf.d/01norecommend << EOF
APT::Install-Recommends "0";
APT::Install-Suggests "0";
EOF
