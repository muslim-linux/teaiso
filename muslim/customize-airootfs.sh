#!/usr/bin/env bash
cd /tmp
# ostree cannot detect boot id
export OSTREE_BOOTID="$(echo $RANDOM | md5sum -)"
set -ex


#### non-usrmerge broken
yes | apt install --reinstall usrmerge -y

### Instally 17g and other stuff
yes | apt install wget
wget https://github.com/muslim-linux/base-files/releases/download/current/base-files_9999-noupdate_amd64.deb
wget https://github.com/muslim-linux/17g-installer/releases/download/current/17g-installer_1.0_all.deb
wget https://github.com/pardus-nosystemd/desktop-base/releases/download/current/desktop-base_9999-noupdate_all.deb
wget https://github.com/muslim-linux/muslim-backgrounds/releases/download/current/muslim-backgrounds_1.0_all.deb
wget https://github.com/aleyna-tilki/pipewire-launcher/releases/download/current/pipewire-launcher_1.0.0_all.deb

#### Disable recommends by default
cat > /etc/apt/apt.conf.d/01norecommend << EOF
APT::Install-Recommends "0";
APT::Install-Suggests "0";
EOF

# install quran app
wget https://github.com/DBChoco/Muezzin/releases/download/v2.6.0/muezzin_2.6.0_amd64.deb
yes | apt install ./*.deb -yq --allow-downgrades


# fix muezzin icon
install /usr/share/icons/hicolor/0x0/apps/muezzin.png /usr/share/icons/hicolor/512x512/apps/muezzin.png
gtk-update-icon-cache /usr/share/icons/hicolor/

