#!/bin/bash
# permissions & users
echo "-----5-----processes-----5-----"
echo ""
# processes
echo "ps – creates a snapshot of all processes that have controlling terminals."
echo "> ps aux |  head -n 10 "
ps aux |  head -n 10
echo ""
echo "netstat – shows the system’s network information, like routing and sockets."
echo "this, for instance, lists traffic using the Transmission Control Protocol (TCP)"
echo "> netstat -vanp tcp |  head -n 10"
netstat -vanp tcp |  head -n 10

echo ""
echo "---------"
echo "now try: "
echo "---------"
echo "- figuring out what these commands do:"
echo "  - top"
echo "  - kill"
echo "  - systemctl"
echo "- following a file with tail, and killing the command in a different terminal window"
echo "- go to https://[any_website_here] and figure out the IDs of the processes that are associated with that traffic"

