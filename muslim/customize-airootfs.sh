#!/usr/bin/env bash
cd /tmp
# ostree cannot detect boot id
export OSTREE_BOOTID="$(echo $RANDOM | md5sum -)"
set -ex

### Instally 17g and other stuff
yes | apt install wget
wget https://github.com/muslim-linux/base-files/releases/download/current/base-files_9999-noupdate_amd64.deb
wget https://github.com/muslim-linux/17g-installer/releases/download/current/17g-installer_1.0_all.deb
wget https://github.com/pardus-nosystemd/desktop-base/releases/download/current/desktop-base_9999-noupdate_all.deb
wget https://github.com/muslim-linux/muslim-backgrounds/releases/download/current/muslim-backgrounds_1.0_all.deb

#### Disable recommends by default
cat > /etc/apt/apt.conf.d/01norecommend << EOF
APT::Install-Recommends "0";
APT::Install-Suggests "0";
EOF

# install quran app
wget https://github.com/DBChoco/Muezzin/releases/download/v2.6.0/muezzin_2.6.0_amd64.deb
yes | apt install ./*.deb -yq --allow-downgrades

#### non-usrmerge broken
yes | apt install --reinstall usrmerge -y

# fix muezzin icon
install /usr/share/icons/hicolor/0x0/apps/muezzin.png /usr/share/icons/hicolor/512x512/apps/muezzin.png
gtk-update-icon-cache /usr/share/icons/hicolor/

# install flatpak
yes | apt install flatpak gnome-software-plugin-flatpak -yq
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
