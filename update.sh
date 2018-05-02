#!/bin/bash
echo "欢迎使用一键搭建 脚本"
echo "即将搭建的是Sannian-Cloud-Radar 05.02A "
echo "交流群：697156614，感谢使用"
echo "准备开始安装"
read -p "请输入群号后开始安装："
echo "请输入 你服务器的 内网ip" 
read -p "内网ip： " ip
cp /root/Sandar/restart.sh /root/restart.sh
chmod +x restart.sh
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log

echo "ss搭建成，请记住连接信息."
read -p "记住了吗？任意键继续." 

curl https://raw.githubusercontent.com/creationix/nvm/v0.13.1/install.sh | bash
source ~/.bash_profile
nvm install v9.8.0
nvm alias default v9.8.0
yum -y install gcc-c++
yum -y install flex
yum -y install bison
wget http://www.tcpdump.org/release/libpcap-1.8.1.tar.gz
tar -zxvf libpcap-1.8.1.tar.gz
cd libpcap-1.8.1
./configure
make
make install

git clone https://github.com/sannian66/Sandar.git
cd Sandar/
npm i
npm i -g pino
npm install -g forever
forever start index.js sniff eth0 $ip | pino

echo "搭建完成，加群：697156614 获取最新动态"
