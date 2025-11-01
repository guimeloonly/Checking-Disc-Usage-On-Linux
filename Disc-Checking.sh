#!/bin/bash

LIMIT=80

echo "Checking Disc usage..."

df -h --output=pcent,target | tail -n +2 | while read usage build_place; do

 usage=${usage%\%}

 if [ "$usage" -ge "$LIMIT" ]; then
	echo "Warnnig: $build_place is with $usage% of usage!"
 if command -v notify-send &> /dev/null; then
	 notify-send "Disc Warning" "$build_place is with $usage% used!"
 fi

 else
	echo "$build_place: $usage% used"
 fi

done
