#!/bin/bash

DIR=$(dirname $(readlink -f $0))

source "${DIR}/../includes/print-utils.src"
source "${DIR}/../includes/trace-utils.src"

directory=${DIR}/files
echo "The directory $directory contains the following files:"
files="$(ls $directory)"
for file in $files
do
    echo $file
    IFS=$'\n'
    data=$(cat $directory/$file)
    for item in $data
    do
        echo $item
    done

done    