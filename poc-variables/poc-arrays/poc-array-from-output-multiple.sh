#!/bin/bash

DIR=$(dirname $(readlink -f $0))

source "${DIR}/../../includes/print-utils.src"

declare -a data=($(cat "${DIR}/files/fruits.txt"))

function showArray {
    echo "Content: ${data[*]}"
    echo "Elements (size = ${#data[@]}):"
    for item in ${data[@]}
        do
            echo -e "\t ${item}"
        done
}

function main {
    print_info "Check array data..."
    showArray

    print_done "Poc completed sucessfully"
}

main $@
