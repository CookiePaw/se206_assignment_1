#!/bin/bash

OUTPUT='out.txt'
CONTENT=`cat *.contact`
echo $CONTENT | xargs -n1 | sort -u > $OUTPUT
