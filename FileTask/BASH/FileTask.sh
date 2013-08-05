#!/bin/bash

if [ $# == 0 ]; then
	read -p "Directory: " DIRECTORY
	read -p "Contact Name: " NAME
	read -p "Contact Number: " NUMBER
else
	DIRECTORY=$1
	NAME=$2
	NUMBER=$3
fi

if [ ! -d $DIRECTORY ]; then mkdir -p $DIRECTORY; fi

EXTENSION=".contact"
FILENAME=$NAME$EXTENSION
COUNT=0
while [ -e $DIRECTORY'/'$FILENAME ]; do
	COUNT=$((COUNT + 1))
	FILENAME=$NAME'('$COUNT')'$EXTENSION
done

echo $NUMBER > $DIRECTORY'/'$FILENAME

