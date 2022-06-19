#!/bin/bash
echo "[+] Changing MAC.. "
sudo ifconfig wlan0 down
sudo macchanger wlan0 -a
sudo ifconfig eth0 down
sudo macchanger eth0 -a
sudo ifconfig eth0 up
clear
echo "[+] Updating.. "
sudo apt update
clear
echo "[+] Downloading repo.. "
sudo wget -P /home/kali "https://protonvpn.com/download/protonvpn-stable-release_1.0.1-1_all.deb" 
clear
echo "[+] Installing repo.. "
sudo apt install /home/kali/protonvpn-stable-release_1.0.1-1_all.deb
clear
echo "[+] Updating repo.. "
sudo apt update
clear
echo "[+] Installing VPN.. "
sudo apt install -y protonvpn
clear
echo "[+] Login: "
read LOGIN
protonvpn-cli login $LOGIN
echo "[+] Running.. "
protonvpn-cli ks --permanent
echo "[+] Running.. "
protonvpn-cli c
clear
echo "[+] Installing VirtualBox.. "
sudo apt install -y virtualbox
clear
echo "[+] Mounting.. "
virtualbox /home/kali/kaliconfig/kali.vbox
