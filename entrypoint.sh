#!/bin/sh
export PATH=${PATH}:/usr/bin:/bin
# Create directory
mkdir -pv /var/lib/transmission/downloads /var/lib/transmission/incomplete /var/lib/transmission/watch

# Use default settings when settings.json is not exists
if [[ ! -f /var/lib/transmission/settings.json ]]; then
    cp -f /data/settings.json /var/lib/transmission/settings.json
    # Apply environment to settings.json
    sed -i 's/^.*rpc-username.*/    "rpc-username": "'$(echo $TR_USERNAME)'",/' /var/lib/transmission/settings.json
    sed -i 's/^.*rpc-password.*/    "rpc-password": "'$(echo $TR_PASSWORD)'",/' /var/lib/transmission/settings.json
    sed -i 's/^.*rpc-port.*/    "rpc-port": '$(echo $TR_RPC_PORT)',/' /var/lib/transmission/settings.json
    sed -i 's/^.*peer-port".*/    "peer-port": '$(echo $TR_PEER_PORT)',/' /var/lib/transmission/settings.json
fi
# Change permission
chown -R $PUID:$PGID /var/lib/transmission
# Update tracker job
crond
# Start Transmission
su-exec $PUID:$PGID transmission-daemon $@