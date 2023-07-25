#!/bin/bash


while getopts h opt
do      case "$opt" in
        q)      quality="$OPTARG";;
        h)      echo >&2 "Usage: $0 [-h] files-to-transform ..."
                exit 1;;
        \?)     echo "Invalid Option: -$OPTARG" 1>&2
                exit 1
                ;;
        esac
done
shift $((OPTIND -1))

files=$1; shift

if [[ -z "$files" ]]
then
    files = "NOT_SUPPLIED.png"
fi

for file in **/${files}; do
    echo cwebp -q 50 -m 6 -af -f 50 -sharpness 0 -mt -v -progress "${file}" -o "${file%.*}.webp"
done
