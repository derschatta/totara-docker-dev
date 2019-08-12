#!/bin/bash

cd /root/

echo "Starting mutagen daemon"

if [[ ! -d /syncit ]]
then
    mkdir /syncit
fi

if [[ ! -f /root/mutagen.yml ]]
then
    echo "mutagen.yml file not found. Exiting."
    exit 1
fi

./mutagen daemon start

# check if there's already a session
./mutagen sync list | grep "totara" &> /dev/null

if [[ $? != 0 ]]; then
    ./mutagen sync create \
        -c /root/mutagen.yml \
        -n totara \
        /syncit/ /root/totara/
else
    ./mutagen sync resume totara
fi

./mutagen sync monitor totara