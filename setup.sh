#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
	echo "You need to run this script as root"
	exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
	echo "OpenVZ is not supported"
	exit 1
fi
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
akbarvpn="raw.githubusercontent.com/NevermoreSSH/hop/main/ssh"
akbarvpnn="raw.githubusercontent.com/NevermoreSSH/hop/main/sstp"
akbarvpnnn="raw.githubusercontent.com/NevermoreSSH/hop/main/ssr"
akbarvpnnnn="raw.githubusercontent.com/NevermoreSSH/hop/main/shadowsocks"
akbarvpnnnnn="raw.githubusercontent.com/NevermoreSSH/hop/main/wireguard"
akbarvpnnnnnn="raw.githubusercontent.com/NevermoreSSH/hop/main/xray"
akbarvpnnnnnnn="raw.githubusercontent.com/NevermoreSSH/hop/main/ipsec"
akbarvpnnnnnnnn="raw.githubusercontent.com/NevermoreSSH/hop/main/backup"
akbarvpnnnnnnnnn="raw.githubusercontent.com/NevermoreSSH/hop/main/websocket"
akbarvpnnnnnnnnnn="raw.githubusercontent.com/NevermoreSSH/hop/main/ohp"
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP=$(curl -s ipinfo.io/ip )
MYIP=$(curl -sS ipv4.icanhazip.com)
MYIP=$(curl -sS ifconfig.me )
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 1.1.1.1" >> /etc/resolv.conf
rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Already Installed"
exit 0
fi
mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
wget https://${akbarvpn}/slhost.sh && chmod +x slhost.sh && ./slhost.sh
wget https://${akbarvpnnnnnn}/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
wget https://${akbarvpn}/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
wget https://${akbarvpnn}/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
wget https://${akbarvpnnn}/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
wget https://${akbarvpnnnn}/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
wget https://${akbarvpnnnnn}/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
wget https://${akbarvpnnnnnnn}/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh
wget https://${akbarvpnnnnnnnn}/set-br.sh && chmod +x set-br.sh && ./set-br.sh
wget https://${akbarvpnnnnnnnnn}/edu.sh && chmod +x edu.sh && ./edu.sh
wget https://${akbarvpnnnnnnnnnn}/ohp.sh && chmod +x ohp.sh && ./ohp.sh
wget https://raw.githubusercontent.com/NevermoreSSH/hop/main/SLDNS/install-sldns && chmod +x install-sldns && ./install-sldns
rm -f /root/ssh-vpn.sh
rm -f /root/sstp.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/ohp.sh
rm -f /root/install
rm -f /root/sl-grpc.sh
rm -f /root/install-sldns
rm -f /root/install-ss-plugin.sh
history -c
echo "1.2" > /home/ver
reboot
