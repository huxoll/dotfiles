#!/bin/bash

progress="-progress"

while getopts hq opt
do      case "$opt" in
        q)      progress="";;
        h)      echo >&2 "Usage: $0 [-h] files-to-transform ..."
                exit 1;;
        \?)     echo "Invalid Option: -$OPTARG" 1>&2
                exit 1
                ;;
        esac
done
shift $((OPTIND -1))

if [[ -z "${@}" ]]
then
    echo "No files supplied."
    exit 1
fi

for file in "${@}"; do
  echo -n "Working on ${file}..."
  if [[ -f "${file%.*}.webp" ]]
  then
    echo "exists, skipping."
    continue
  fi
  cwebp -q 75 -m 6 -af -f 50 -sharpness 0 -mt -short ${progress} "${file}" -o "${file%.*}.webp"
done


