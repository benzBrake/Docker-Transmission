#!/bin/sh
ps -ef | grep crond > /dev/null
if [[ $? -ne 0 ]]; then
    crond
fi
curl localhost:9091 || exit 1
exit 0