#!/bin/bash

DIR=$(dirname $(readlink -f $0))

source "${DIR}/../includes/print-utils.src"

declare -a fruits=($(cat "${DIR}/files/fruits.txt"))

function showArray {
    echo "Content: ${fruits[*]}"
    echo "Elements (size = ${#fruits[@]}):"
    for fruit in ${fruits[@]}
        do
            echo -e "\t ${fruit}"
        done
}

function main {
    print_info "Check array data..."
    showArray

    print_done "Poc completed sucessfully"
}

main $@
