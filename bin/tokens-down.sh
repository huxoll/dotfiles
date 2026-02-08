#!/bin/bash

GDRIVE=/home/gardnerj/GoogleDrive

TMP=/tmp/$(basename $0).$$
/usr/bin/rclone sync -v gdrive:Games/Tokens ${GDRIVE}/Games/Tokens --include "*.webp" --skip-links > $TMP 2>&1

grep "There was nothing" $TMP > /dev/null || (echo "Copied files!" && cat $TMP && /home/gardnerj/bin/linux_links.sh)
