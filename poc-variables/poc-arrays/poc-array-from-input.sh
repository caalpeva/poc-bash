#!/bin/bash

DIR=$(dirname $(readlink -f $0))

source "${DIR}/../../includes/print-utils.src"

function main {
    echo "Enter data list separated by spaces:"
    read -a data
    
    print_info "Checking entered data..."
    echo "Content: ${data[*]}"
    echo "Elements (size = ${#data[@]}):"
    for item in ${data[@]}
        do
            echo -e "\t ${item}"
        done

    print_done "Poc completed sucessfully"
}

main $@
