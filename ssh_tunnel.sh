#!/bin/bash
# useful when blocked by a firewall and can't access server console (e.g. DRAC)

echo "enter your final destination:"
read HOST   
echo "and the host to jump through:"
read JUMPBOX

sudo ssh -f -L 443:${HOST}:443 ${JUMPBOX} -N

echo "now you have access to the host via:"
echo "https://localhost"
