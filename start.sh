#!/bin/bash

if [[ -n $RCLONE_CONFIG && -n $RCLONE_DESTINATION ]]; then
	echo "Rclone config detected"
	echo -e "[DRIVE]\n$RCLONE_CONFIG" > rclone.conf
	echo "on-download-stop=./delete.sh" >> airc.conf
	echo "on-download-complete=./on-complete.sh" >> airc.conf
	chmod +x delete.sh
	chmod +x on-complete.sh
fi

echo "rpc-secret=$ARIA2C_SECRET" >> airc.conf
aria2c --conf-path=airc.conf&
yarn start
