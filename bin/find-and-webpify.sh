#!/bin/bash

pattern="*.*g"

while getopts hq opt
do      case "$opt" in
        q)      ;;
        h)      echo >&2 "Usage: $0 [-h] files-to-transform ..."
                exit 1;;
        \?)     echo "Invalid Option: -$OPTARG" 1>&2
                exit 1
                ;;
        esac
done

find . -name "$pattern" -print0 | xargs -0 -n 1 -P 6 webpify-high.sh $@


