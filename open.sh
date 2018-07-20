iptables -L
iptables -F
iptables -X
iptables -L
iptables -t filter -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 10001 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 10002 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 30001 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 20001 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 30051 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 8880 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 62030 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 10100 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 10101:10199 -j ACCEPT
iptables -t filter -A INPUT -p udp --dport 53999 -j ACCEPT
iptables -L
