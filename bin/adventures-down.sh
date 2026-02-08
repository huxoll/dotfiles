#!/bin/bash

GDRIVE=/home/gardnerj/GoogleDrive

TMP=/tmp/$(basename $0).$$
# echo /usr/bin/rclone sync -v gdrive:Games/DND/Adventures ${GDRIVE}/Games/DND/Adventures --exclude "/OldModules**" --exclude "**-Maps.pdf" --stats 0 --stats-log-level ERROR 
/usr/bin/rclone sync -v gdrive:Games/DND/Adventures ${GDRIVE}/Games/DND/Adventures --exclude "/OldModules**" --exclude "**-Maps.pdf" --stats 0 --stats-log-level ERROR > $TMP 2>&1
/usr/bin/rclone sync -v "gdrive:Games/TTRPG/Stygian Library web 2024-09-06.pdf" ${GDRIVE}/Games/TTRPG/ --stats-log-level ERROR > $TMP 2>&1
/usr/bin/rclone sync -v "gdrive:Games/TTRPG/20th-To_the_End_of_TIme.pdf" ${GDRIVE}/Games/TTRPG/ --stats-log-level ERROR > $TMP 2>&1
