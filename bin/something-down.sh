#!/bin/bash

GDRIVE=/home/gardnerj/GoogleDrive

ARGS=""

usage() { echo "Usage: $0 [-q] [-v] [-p <subpath>]" 1>&2; exit 1; }

while getopts "qvdp:" arg; do
    case "${arg}" in
        q)
            ARGS="-q $ARGS"
            ;;
        v)
            ARGS="$ARGS -v -P"
            ;;
        d)
            ARGS="$ARGS --dry-run"
            ;;
        p)
            SUBPATH="${OPTARG}"
            ;;
	*)
	    usage
	    ;;
    esac
done

if [ -z "${SUBPATH}" ]
then
	echo "No subpath supplied! Use the -p argument."
	exit 1
fi

echo "Copying gdrive:Games/${SUBPATH} to ${GDRIVE}/Games/${SUBPATH}"

/usr/bin/rclone sync ${ARGS} "gdrive:Games/${SUBPATH}" "${GDRIVE}/Games/${SUBPATH}"
