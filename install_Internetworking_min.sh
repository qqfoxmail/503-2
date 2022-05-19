#!/usr/bin/env bash
#
# Copyright (C) 2009-2021 Internetworking.cn, TianHP AT Yeah DOT net.

# Ubuntu-Mate 22.04

export SHAREROOT=~/ShareRoot/
export DOWNLOAD_MIRROR=http://localhost/mirror/
export SRC_DOWNLOAD=~/download

mkdir -p ${SHAREROOT}
mkdir -p ~/{Internetworking,Archives,download,build_dir,staging_dir}

ln -s ~/build_dir ~/Internetworking/
ln -s ~/staging_dir ~/Internetworking/
ln -s ~/download ~/Internetworking/

sudo chown `whoami` ~/{Archives,download,build_dir,staging_dir} ${SHAREROOT}

################################################################################
# Microsoft VScode
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF

sudo apt update;

sudo apt purge -y whoopsie avahi-autoipd avahi-daemon avahi-utils

sudo apt purge -y samba* smb* openvpn* libreoffice*

sudo apt install -y pluma net-tools inetutils-traceroute nmap curl gparted udhcpc \
	axel usb-creator-gtk synaptic

sudo apt install -y zsh zsh-common zsh-syntax-highlighting
sudo apt install -y zsh-autosuggestions
#sudo apt install -y ~/Internetworking/my_inet/zsh-autosuggestions_0.6.4-1_all.deb

sudo apt install -y ckermit
# sudo apt install -y ~/Internetworking/my_inet/ckermit_305~alpha02-1_amd64.deb

# SSH:
# 安装openssh-server sshfs。Ubuntu 默认安装 openssh-client。
sudo apt install -y openssh-server openssh-client sshfs

ssh-keygen -t rsa

sudo apt install -y fcitx5-config-qt
#fcitx-googlepinyin

sudo apt install -y autoconf automake binutils bison build-essential bzip2 cmake \
	debian-keyring flex g++ gawk gcc git grep libc6 libncurses-dev make rsync perl \
	quilt subversion texinfo unzip zlib1g-dev u-boot-tools

sudo apt install -y unzip unrar

sudo apt autoremove

sudo timedatectl set-timezone Asia/Shanghai
sudo timedatectl set-ntp no
sudo timedatectl set-local-rtc 1

cd ~/Internetworking/scripts/config
make clean
cd ~/Internetworking/

# user.name and user.email for git
git config --global user.name "HongPeng Tian"
git config --global user.email "TianHP AT Yeah DOT net."
git config pull.ff only


# firefox http://127.0.0.1/

sudo apt install -y lighttpd
sudo cp ~/Internetworking/my_inet/lighttpd.conf /etc/lighttpd/lighttpd.conf
sudo service lighttpd restart

# stop tftpd
sudo apt install -y tftpd-hpa
sudo service tftpd-hpa stop

# configure
cat >tftpd-hpa<<EOF
# /etc/default/tftpd-hpa

TFTP_USERNAME="tftp"
TFTP_DIRECTORY="${SHAREROOT}"
TFTP_ADDRESS=":69"
TFTP_OPTIONS="--secure"
EOF

sudo mkdir -p /etc/default/
sudo mv tftpd-hpa /etc/default/tftpd-hpa

# start tftpd
sudo service tftpd-hpa start

cp ~/Internetworking/my_inet/zshrc ~/.zshrc
cp ~/Internetworking/my_inet/bashrc ~/.bashrc
cp ~/Internetworking/my_inet/kermrc ~/kermrc
cp ~/Internetworking/my_inet/quiltrc ~/quiltrc

sudo apt upgrade -y; sudo apt autoremove

mkdir -p ~/Internetworking/staging_dir/toolchain-arm_cortex-a7_gcc-11.2.0_glibc_eabi/bin
cd ~/Internetworking/staging_dir/toolchain-arm_cortex-a7_gcc-11.2.0_glibc_eabi/bin
ln -sf arm-internetworking-linux-addr2line arm-himix200-linux-addr2line
ln -sf arm-internetworking-linux-ar arm-himix200-linux-ar
ln -sf arm-internetworking-linux-as arm-himix200-linux-as
ln -sf arm-internetworking-linux-c++ arm-himix200-linux-c++
ln -sf arm-internetworking-linux-c++filt arm-himix200-linux-c++filt
ln -sf arm-internetworking-linux-cpp arm-himix200-linux-cpp
ln -sf arm-internetworking-linux-gcc arm-himix200-linux-gcc
ln -sf arm-internetworking-linux-elfedit arm-himix200-linux-elfedit
ln -sf arm-internetworking-linux-g++ arm-himix200-linux-g++
ln -sf arm-internetworking-linux-gcc-11.2.0 arm-himix200-linux-gcc-6.3.0
ln -sf arm-internetworking-linux-gcc-ar arm-himix200-linux-gcc-ar
ln -sf arm-internetworking-linux-gcc arm-himix200-linux-gcc
ln -sf arm-internetworking-linux-gcc-nm arm-himix200-linux-gcc-nm
ln -sf arm-internetworking-linux-gcc-ranlib arm-himix200-linux-gcc-ranlib
ln -sf arm-internetworking-linux-gcov arm-himix200-linux-gcov
ln -sf arm-internetworking-linux-gcov-dump arm-himix200-linux-gcov-dump
ln -sf arm-internetworking-linux-gcov-tool arm-himix200-linux-gcov-tool
ln -sf arm-internetworking-linux-gdb arm-himix200-linux-gdb
ln -sf arm-internetworking-linux-gprof arm-himix200-linux-gprof
ln -sf arm-internetworking-linux-ld arm-himix200-linux-ld
ln -sf arm-internetworking-linux-ld.bfd arm-himix200-linux-ld.bfd
ln -sf arm-internetworking-linux-lto-dump arm-himix200-linux-lto-dump
ln -sf arm-internetworking-linux-nm arm-himix200-linux-nm
ln -sf arm-internetworking-linux-objcopy arm-himix200-linux-objcopy
ln -sf arm-internetworking-linux-objdump arm-himix200-linux-objdump
ln -sf arm-internetworking-linux-ranlib arm-himix200-linux-ranlib
ln -sf arm-internetworking-linux-readelf arm-himix200-linux-readelf
ln -sf arm-internetworking-linux-size arm-himix200-linux-size
ln -sf arm-internetworking-linux-strings arm-himix200-linux-strings
ln -sf arm-internetworking-linux-strip arm-himix200-linux-strip

