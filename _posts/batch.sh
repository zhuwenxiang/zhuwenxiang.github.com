#!/bin/bash

for file in `ls *.md`
do
    name=`echo $file | ./urldecode.sh`
    mv $file $name
    #mv $file $file.$$
done
