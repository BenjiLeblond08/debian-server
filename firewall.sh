#!/bin/sh

# Flush existing rules
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

# Drop All
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# Established connexion
#iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
#iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Permettre à une connexion ouverte de recevoir du trafic en entrée.
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# Permettre à une connexion ouverte de recevoir du trafic en sortie.
iptables -A OUTPUT -m conntrack ! --ctstate INVALID -j ACCEPT

# loopback (localhost)
iptables -I INPUT -i lo -j ACCEPT
#iptables -A INPUT -i lo -j ACCEPT
#iptables -A OUTPUT -o lo -j ACCEPT

# ICMP requests (ping)
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j DROP
#iptables -A INPUT -p icmp -j ACCEPT
#iptables -A OUTPUT -p icmp -j ACCEPT

# Multicast
iptables -A INPUT -m pkttype --pkt-type multicast -j ACCEPT

# Samba
iptables -t raw -A OUTPUT -p udp -m udp --dport 137 -j CT --helper netbios-ns

# Drop XMAS and NULL scans
iptables -A INPUT -p tcp --tcp-flags FIN,URG,PSH FIN,URG,PSH -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP

# Dropper silencieusement tous les paquets broadcastés.
iptables -A INPUT -m pkttype --pkt-type broadcast -j DROP

# SSH
iptables -A INPUT -p tcp --dport ssh -j ACCEPT
iptables -A OUTPUT -p tcp --dport ssh -j ACCEPT

# DNS Server
#iptables -A OUTPUT -p tcp --dport 53 -j ACCEPT
#iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
#iptables -A INPUT -p tcp --dport 53 -j ACCEPT
#iptables -A INPUT -p udp --dport 53 -j ACCEPT

# NTP (Time)
iptables -A OUTPUT -p udp --dport 123 -j ACCEPT

# HTTP
#iptables -A INPUT -p tcp --dport http -j ACCEPT
#iptables -A INPUT -p tcp --dport https -j ACCEPT
#iptables -A OUTPUT -p tcp --dport http -j ACCEPT
#iptables -A OUTPUT -p tcp --dport https -j ACCEPT

#iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
#iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
#iptables -A INPUT -p tcp --dport 80 -j ACCEPT
#iptables -A INPUT -p tcp --dport 443 -j ACCEPT
#iptables -A INPUT -p tcp --dport 8443 -j ACCEPT

# FTP
#iptables -A OUTPUT -p tcp --dport 21 -j ACCEPT
#iptables -A OUTPUT -p tcp --dport 20 -j ACCEPT
#iptables -A INPUT -p tcp --dport 20 -j ACCEPT
#iptables -A INPUT -p tcp --dport 21 -j ACCEPT

# MAIL

## SMTP
#iptables -A INPUT -p tcp --dport 25 -j ACCEPT
#iptables -A OUTPUT -p tcp --dport 25 -j ACCEPT

## POP3
#iptables -A INPUT -p tcp --dport 110 -j ACCEPT
#iptables -A OUTPUT -p tcp --dport 110 -j ACCEPT

## IMAP
#iptables -A INPUT -p tcp --dport 143 -j ACCEPT
#iptables -A OUTPUT -p tcp --dport 143 -j ACCEPT

## POP3S
#iptables -A INPUT -p tcp --dport 995 -j ACCEPT
#iptables -A OUTPUT -p tcp --dport 995 -j ACCEPT

# Log INPUT and FORWARD packets 
iptables -A INPUT -j LOG
iptables -A FORWARD -j LOG 

exit 0
