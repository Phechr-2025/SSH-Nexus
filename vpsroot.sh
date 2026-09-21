#!/bin/bash
# Mod By NevermoreSSH
wget -qO- -O /etc/ssh/sshd_config https://raw.githubusercontent.com/NevermoreSSH/hop/main/sshd_config;
systemctl restart sshd;
clear;
echo -e "Masukkan Password:";
read -e pwe;
usermod -p `perl -e "print crypt(\"$pwe\",\"Q4\")"` root;
clear;
printf "Mohon Simpan Informasi Akun VPS Ini\n============================================\nAkun Root (Akun Utama)\nIp address = $(curl -Ls http://ipinfo.io/ip)\nUsername   = root\nPassword   = $pwe\n============================================\n";
exit;
