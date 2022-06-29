# Make network availabe for all your container and it will also let them communicate with each-other

# It will get your current getway ip
getway=$(ip route get 8.8.8.8 | grep -oP '(?<=via )[^ ]*')

#it will add your getway ip to your iptable rules in android

sudo ip route add default via $getway dev wlan0
sudo ip rule add from all lookup main pref 30000
sudo ip rule add pref 1 from all lookup main
sudo ip rule add pref 2 from all lookup default

# This is my hack to renew my duck-dns ip with my current ipv4 and ipv6 but dissabled for now for this script will add it with more details later
# It will renew as soon as you change your network so only running this script also update with new ips so saves from chacking of dynamic ips
# bash /data/data/com.termux/files/home/duckdns/duck.sh


