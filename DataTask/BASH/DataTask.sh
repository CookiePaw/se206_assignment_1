#!/bin/bash

CURDIR='.'
OUTPUT='out.txt'

if [ -e $OUTPUT ]; then > $OUTPUT; fi

for FILE in *; do
	if [[ $FILE == *.contact ]]; then
		CONTENT="$CONTENT $(<$FILE)"
	fi
done;
echo $CONTENT | xargs -n1 | sort -u > $OUTPUT

