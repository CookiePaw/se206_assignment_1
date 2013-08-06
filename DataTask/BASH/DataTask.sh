#!/bin/bash

# Set output file name as 'out.txt'
OUTPUT='out.txt'

# Read and concatinate the contents of file
CONTENT=`cat *.contact`

# The variable CONTENT could either be in vertical or horizontal manner.
# Using 'xarg -n1' will convert it to 1 column of text, then the 
# 'sort -u' will take care of the uniqueness and the 'alphabetical' 
# order. The result will be written into 'out.txt'.
echo $CONTENT | xargs -n1 | sort -u > $OUTPUT
