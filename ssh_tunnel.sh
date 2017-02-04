#!/bin/bash
# useful when blocked by a firewall and can't access server console (e.g. DRAC)

echo "Final destination:"
read HOST   
echo "Host to jump through:"
read JUMPBOX
echo "Port to forward:"
read PORT

if sudo ssh -f -L ${PORT}:${HOST}:${PORT} ${JUMPBOX} -N ; then
    echo "Access via localhost on port $PORT"
else
    echo "Something went wrong..."
fi
