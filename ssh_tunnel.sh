#!/bin/bash
# useful when blocked by a firewall and can't access server console (e.g. DRAC)

echo "enter your final destination:"
read HOST   
echo "and the host to jump through:"
read JUMPBOX

if sudo ssh -f -L 443:${HOST}:443 ${JUMPBOX} -N ; then
    echo 'access via https://localhost'
else
    echo 'something went wrong...'
fi
