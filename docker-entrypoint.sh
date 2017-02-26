#!/bin/bash
set -e

service postfix stop


if [ "$1" = "bash" ]; then 
    /bin/bash;
else
    exec /usr/lib/postfix/sbin/master -c /etc/postfix -d 2>&1
fi
