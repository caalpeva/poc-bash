#!/bin/bash

DIR=$(dirname $(readlink -f $0))

source "${DIR}/../includes/print-utils.src"

declare -a fruits=("apple" "banana" "melon" "strawberry" "orange" "lemon")
fruits[6]="pear"

function unsetArrayElement {
    print_debug "Remove element from array with index $1 and value ${fruits[$1]}"
    unset fruits[$1]
    #echo ${fruits[$1]}
}

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

    print_info "Remove elements from array ..."
    unsetArrayElement 4
    unsetArrayElement 2

    print_info "Check array data after removing elements..."
    showArray

    print_done "Poc completed sucessfully"
}

main $@
