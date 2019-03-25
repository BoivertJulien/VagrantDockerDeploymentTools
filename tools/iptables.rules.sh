#!/bin/sh
### BEGIN INIT INFO
# Provides:          Firewall maison
# Required-Start:    $local_fs $remote_fs $network $syslog
# Required-Stop:     $local_fs $remote_fs $network $syslog
# Default-Start:
# Default-Stop:
# X-Interactive:     false
# Short-Description: Firewall maison
### END INIT INFO

# On nettoie tout
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t filter -F
iptables -t filter -X
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

# Ne pas casser les connexions établies
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT


# SSH IN/OUT
iptables -t filter -A INPUT -p tcp --dport 1969 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 1969 -j ACCEPT


# HTTP + HTTPS Out
iptables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 443 -j ACCEPT
# HTTP + HTTPS In
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 8443 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 1996 -j ACCEPT

# Mail SMTP:25
#iptables -t filter -A INPUT -p tcp --dport 25 -j ACCEPT
#iptables -t filter -A OUTPUT -p tcp --dport 25 -j ACCEPT
# Mail POP3:110
#iptables -t filter -A INPUT -p tcp --dport 110 -j ACCEPT
#iptables -t filter -A OUTPUT -p tcp --dport 110 -j ACCEPT
# Mail IMAP:143
#iptables -t filter -A INPUT -p tcp --dport 143 -j ACCEPT
#iptables -t filter -A OUTPUT -p tcp --dport 143 -j ACCEPT
# Mail POP3S:995
#iptables -t filter -A INPUT -p tcp --dport 995 -j ACCEPT
#iptables -t filter -A OUTPUT -p tcp --dport 995 -j ACCEPT


# FTP Out
iptables -t filter -A OUTPUT -p tcp --dport 21 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 20 -j ACCEPT
# FTP In
# imodprobe ip_conntrack_ftp # ligne facultative avec les serveurs OVH
iptables -t filter -A INPUT -p tcp --dport 20 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


# DNS In/Out
iptables -t filter -A OUTPUT -p tcp --dport 53 -j ACCEPT
iptables -t filter -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 53 -j ACCEPT
# NTP Out
iptables -t filter -A OUTPUT -p udp --dport 123 -j ACCEPT
# Autorise le loopback (127.0.0.1)
iptables -t filter -A INPUT -i lo -j ACCEPT
iptables -t filter -A OUTPUT -o lo -j ACCEPT

# ICMP (le ping)
iptables -t filter -A INPUT -p icmp -j ACCEPT
iptables -t filter -A OUTPUT -p icmp -j ACCEPT
# Monit
iptables -t filter -A INPUT -p tcp --dport 4598 -j ACCEPT
# Webmin
iptables -t filter -A INPUT -p tcp --dport 10000 -j ACCEPT

