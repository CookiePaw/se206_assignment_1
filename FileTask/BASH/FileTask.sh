#!/bin/bash

# If command line is empty, read from STDIN
if [ $# == 0 ]; then
	read -p "Directory: " DIRECTORY
	read -p "Contact Name: " NAME
	read -p "Contact Number: " NUMBER

# Otherwise, read from command line
else
	DIRECTORY=$1
	NAME=$2
	NUMBER=$3
fi

# If directory does not exist, create.
if [ ! -d $DIRECTORY ]; then mkdir -p $DIRECTORY; fi

# Initialise variables accordingly
EXTENSION=".contact"
FILENAME=$NAME$EXTENSION

# If file already exists, create a new file with +1 index
COUNT=0
while [ -e $DIRECTORY'/'$FILENAME ]; do
	COUNT=$((COUNT + 1))
	FILENAME=$NAME'('$COUNT')'$EXTENSION
done

# Write contact number to the created file.
echo $NUMBER > $DIRECTORY'/'$FILENAME

