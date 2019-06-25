iptables -F
iptables -X

iptables -t filter -A INPUT -p tcp -i eth0 --dport 80 -j ACCEPT
iptables -t filter -A INPUT -p tcp -i eth0 --dport 443 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 10001 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 10002 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 30001 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 20001 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 30051 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 8880 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 62030 -j ACCEPT

iptables -t filter -A INPUT -p udp -i eth0 --dport 42000 -j ACCEPT

iptables -t filter -A INPUT -p udp -i eth0 --dport 42073 -j ACCEPT
iptables -t filter -A INPUT -p udp -i eth0 --dport 54727 -j ACCEPT

iptables -t filter -A INPUT -p tcp -i wg0 --dport 10022 -j ACCEPT
iptables -t filter -A INPUT -p udp -i wg0 --dport 10100 -j ACCEPT
iptables -t filter -A INPUT -p udp -i wg0 --dport 10101 -j ACCEPT

iptables -A INPUT -p tcp -i eth0 --destination-port 10022 -j DROP
iptables -A INPUT -p udp -i eth0 --destination-port 10100 -j DROP
iptables -A INPUT -p udp -i eth0 --destination-port 10101 -j DROP
iptables -A INPUT -p udp -i eth0 --destination-port 22 -j DROP
iptables -A INPUT -p udp -i eth0 --destination-port 8080 -j DROP


iptables -L -v -n
