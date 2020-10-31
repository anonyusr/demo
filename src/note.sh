#!/bin/bash

#update
#cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.BAK
#wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
#wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
#yum clean all
#yum makecache

sudo ./install-vimix.sh

sudo cp -r PingGuo-Flat-darkblue /usr/share/themes/
cd /etc/apt/
sudo cp sources.list sources_bak.list
sudo apt-get update
sudo apt-get install gnome-tweak

sudo apt-get install openssh-server
sudo service ssh start
sudo apt-get install net-tools
sudo apt-get install vim-nox
sudo apt-get install gcc
sudo apt-get install rar
sudo apt-get install tree
sudo apt-get install git

#install this to mount ntfs filesystem
#yum install -y ntfs-3g

apt-get install shadowsocks  -y
apt-get install privoxy  -y
vim /etc/privoxy/config
cd /etc/shadowsocks
cp local.json US.json
vim US.json
systemctl start privoxy.service
sslocal -c US.json
cat US.json

apt-get install shadowsocks -y
apt-get install privoxy -y
vim /etc/privoxy/config
cd /etc/shadowsocks
sudo cp config.json us.json
systemctl start privoxy.service
sudo sslocal -c /etc/shadowsocks/us.json -d start

wifi&热点
git clone https://github.com/oblique/create_ap
cd create_ap
sudo make install
sudo apt-get install ethtool
sudo apt-get install hostapd dnsmasq haveged iptables
vim creat_ap
改为
is_wifi_connected() {
    return 1
}
sudo ./create_ap wlp1s0 enp0s31f6 ubuntu afi4hk8n

#run chrome
#vim /etc/yum.repos.d/google-chrome.repo
:<<EOF
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch
enabled=1
gpgcheck=1
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub
EOF
#yum -y install google-chrome-stable --nogpgcheck
#/opt/google/chrome/chrome --no-sandbox

:<<EOF
[Desktop Entry]
Encoding=UTF-8
Name=chrome
Comment=chrome
Exec=/opt/google/chrome/chrome baidu.com --no-sandbox
Icon=/opt/google/chrome/product_logo_32.png
Version=1.0
Type=Application
Terminal=false
Name[en_US]=chrome
EOF

#yum install kchmviewer*
#curl 'https://copr.fedorainfracloud.org/coprs/scx/kchmviewer/repo/epel-7/scx-kchmviewer-epel-7.repo' > '/etc/yum.repos.d/scx-kchmviewer-epel-7.repo'
#yum -y install kchmviewer

#config java env
#export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.262.b10-0.el7_8.x86_64
#export JRE_HOME=$JAVA_HOME/jre
#export PATH=$PATH:$JAVA_HOME/bin
#export CLASSPATH=./:$JAVA_HOME/lib:$JAVA_HOME/jre/lib

#config arm-linux-gcc env
export PATH=$PATH:/opt/gcc-linaro-4.9.4-2017.01-x86_64_arm-linux-gnueabihf/bin

#mount ntfs filesystem(/etc/profile)
#if [ ! -d /home/zq/docs/A ];then
#    mount /dev/sda6 /home/zq/docs
#fi

#open usbserival
#chmod +w /proc/tty/driver
#cat /proc/tty/driver/usbserial
#http://alioth.debian.org/projects/minicom/
#yum install minicom.x86_64 
#git clone https://github.com/Distrotech/minicom.git

systemctl enable sshd
systemctl disable sshd

yum install tigervnc -y
yum install tigervnc-server -y
vncpasswd
no
netstat -anput
vncserver :1
vncserver -kill :1
x0vncserver -PasswordFile=.vnc/passwd -AlwaysShared=on -AcceptPointerEvents=on -AcceptKeyEvents=on -geometry=1366x768

#install nautilus
yum install glib2-devel gtk2-devel nautilus-devel gvfs libappindicator-gtk3  python2-gobject
./configure && make


yum install sudo yum install davfs2
vim /etc/davfs2/davfs2.conf
use_locks 0
ignore_dav_header 1
https://dav.jianguoyun.com/dav 488411891@qq.com ax3gbzm6m5wnbe8f
sudo mount -t davfs https://dav.jianguoyun.com/dav ~/Cloud


rm -rf /var/run/yum.pid
yum install java-1.8.0-openjdk-devel.x86_64 -y

systemctl stop firewalld
systemctl disabled firewalld
getenforce
setenforce 0

vim /etc/sysconfig/selinux
SELINUX=disabledsystemctl stop firewalld
systemctl disabled firewalld
getenforce
setenforce 0

vim /etc/sysconfig/selinux
SELINUX=disabled
#/bin/bash
if [ ! -d /mnt/A ];then
mount /dev/sda6 /mnt
fi
#cd /mnt/A/Linux/mycodes/Shell/tests/
#yum remove *openjdk*
#tar xvf jdk-8u221-linux-x64.tar.gz
#vim /etc/profile
export JAVA_HOME=/opt/jdk1.8.0_221
export JRE_HOME=/opt/jdk1.8.0_221/jre
export PATH=$PATH:$JAVA_HOME/bin
export CLASSPATH=./:$JAVA_HOME/lib:$JAVA_HOME/jre/lib

curl -O http://ftp.gnu.org/gnu/glibc/glibc-2.18.tar.gz
tar zxf glibc-2.18.tar.gz 
cd glibc-2.18/
mkdir build
cd build/
../configure --prefix=/usr
make -j2
make install

java -jar xxx.jar

yum install ftp

1.进入启动菜单，在kernel句最后rhgb quiet后加入single。
2.显示failed to mount /sysroot
3.输入xfs_repair -v -L /dev/dm-0
4.重新启动
