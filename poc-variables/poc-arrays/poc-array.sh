#!/bin/bash

DIR=$(dirname $(readlink -f $0))

source "${DIR}/../../includes/print-utils.src"

declare -a data=("apple" "banana" "melon" "strawberry" "orange" "lemon")
data[6]="pear"

function unsetArrayElement {
    print_debug "Remove element from array with index $1 and value ${data[$1]}"
    unset data[$1]
    #echo ${data[$1]}
}

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

    print_info "Remove elements from array ..."
    unsetArrayElement 4
    unsetArrayElement 2

    print_info "Check array data after removing elements..."
    showArray

    print_done "Poc completed sucessfully"
}

main $@
