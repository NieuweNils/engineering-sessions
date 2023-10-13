#!/bin/bash
# networking
echo "-----6-----networking-----6-----"
echo ""
echo "ping – checks the system’s network connectivity."
echo "> ping -c 5 ohchr.org"
ping -c 5 ohchr.org
echo ""
echo "nslookup – queries a domain’s IP address and vice versa."
echo "> nslookup ohchr.org"
nslookup ohchr.org
echo ""
echo "dig – displays DNS information, including record types."
echo "> dig ohchr.org"
dig ohchr.org
echo ""
echo "traceroute – tracks a packet’s hops to its destination."
echo "> traceroute google.com"
traceroute google.com
echo ""
echo "wget – downloads files from a URL."
echo "> wget https://upload.wikimedia.org/wikipedia/commons/4/48/RedCat_8727.jpg"
wget https://upload.wikimedia.org/wikipedia/commons/4/48/RedCat_8727.jpg
echo ""
echo "curl – transmits data between servers using URLs."
echo "> curl https://upload.wikimedia.org/wikipedia/commons/4/48/RedCat_8727.jpg > redcat.jpg"
curl https://upload.wikimedia.org/wikipedia/commons/4/48/RedCat_8727.jpg > redcat.jpg

echo ""
echo "---------"
echo "now try: "
echo "---------"
echo "- figuring out what these commands do:"
echo "  - ifconfig"
echo "  - ssh"
echo "  - scp"
echo "- getting the file of the red cat onto my computer from your terminal (hint: you (hopefully) need my help for that)"