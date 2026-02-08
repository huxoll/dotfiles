#!/bin/bash

GDRIVE=~/GoogleDrive

ARGS=""
QUIET=false

while getopts "qvd" arg; do
    case "${arg}" in
        q)
            QUIET=true
            ;;
        v)
            ARGS="$ARGS -P"
            ;;
        d)
            ARGS="$ARGS --dry-run"
            ;;
    esac
done


GDRIVE=/home/gardnerj/GoogleDrive

TMP=/tmp/$(basename $0).$$
/usr/bin/rclone sync -v $ARGS gdrive:Games/Maps ${GDRIVE}/Games/Maps \
 --filter '+ *.webp' --filter '+ *.webm' --filter '+ *.dd2vtt' --filter '- *' \
 --stats 0 --stats-log-level ERROR \
 > $TMP 2>&1

if [ "$QUIET" == true ] ; then
	grep "There was nothing" $TMP > /dev/null || (echo "Copied files!" && cat $TMP)
else
	echo "Copied files!" && cat $TMP
fi

