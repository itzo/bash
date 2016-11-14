#!/bin/bash
#
# author:        me@itzo.org
# description:   restart puppet if process is hung - bug in puppet 2.7.11
# see also:      http://ryanuber.com/03-31-2012/puppet-agent-hangs-stale-locks.html

FILE=/var/lib/puppet/state/puppetdlock

# Check if there's a lock file first
if [ ! -f $FILE ]; then
  #echo "File $FILE does not exist."
  exit 0
fi

# Consider the file is stale if modified more than 5 minutes ago
STALESEC=300

# UNIX timestamp of last puppetdlock modification
MODIFIED=$(stat -c %Y ${FILE})

# Current UNIX timestamp
NOW=$(date +%s)

# Check if the file is stale and restart it if needed
if [ $((${NOW}-${MODIFIED})) -gt $((${STALESEC})) ]; then
  echo "Lock file is stale - $(( $NOW - $MODIFIED )) sec"
  /bin/rm -f $FILE && /sbin/service puppet restart
fi
