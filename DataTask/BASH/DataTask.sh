#!/bin/bash
if [ `ls | grep 'contact' | wc -w` == 0 ]; then exit; fi
cat `ls | grep 'contact'` | sort -u > out.txt
