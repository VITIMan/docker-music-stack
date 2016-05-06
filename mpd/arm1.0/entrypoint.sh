#!/bin/sh 
set -e
USER_ID=${LOCAL_USER_ID:-1000}
GROUP_ID=${LOCAL_GROUP_ID:-1000}


echo "Starting with UID:$USER_ID GID:$GROUP_ID"
addgroup -g "$GROUP_ID" user
adduser -s /bin/sh -h /home/user -u "$USER_ID" -G user -D user
adduser user audio
export HOME=/home/user

chmod 755 -R /var/lib/mpd
echo "Executing as mpd"

exec gosu mpd "$@"
