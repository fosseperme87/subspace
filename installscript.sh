#!/bin/bash

echo "FOSSEPERME SCRIPT SUBSPACE WIREGUARD PANEL INSTALLER WITHOUT LETSENCRYPT"

apt update

apt upgrade

apt install wireguard qrencode

curl -sSL https://get.docker.com | sh

sudo usermod -aG docker $(whoami)

apt-get remove -y dnsmasq

echo "DNSStubListener=no" >> /etc/systemd/resolved.conf

systemctl restart systemd-resolved

echo nameserver 1.1.1.1 > /etc/resolv.conf

echo nameserver 1.0.0.1 >> /etc/resolv.conf

modprobe wireguard

modprobe iptable_nat

modprobe ip6table_nat

echo "wireguard" > /etc/modules-load.d/wireguard.conf

echo "iptable_nat" > /etc/modules-load.d/iptable_nat.conf

echo "ip6table_nat" > /etc/modules-load.d/ip6table_nat.conf

sysctl -w net.ipv4.ip_forward=1

sysctl -w net.ipv6.conf.all.forwarding=1

apt install docker-compose

apt update

apt upgrade

adocker-compose up --detach

sudo docker start subspace

echo FINISH!!! 


