#!/bin/bash

echo -e "WORKING DIRECTORY: \t $(pwd)"
echo -e "RELATIVE SCRIPT PATH: \t $0"
echo -e "\t- FILENAME: $(basename $0)"
echo -e "\t- RELATIVE DIRECTORY PATH: $(dirname $0) "

DIR=$(dirname $(readlink -f $0))
echo "ABSOLUTE DIRECTORY PATH: ${DIR}"

source "${DIR}/../includes/print-utils.src"

print_debug "This is a line"
sleep 2
print_info "This is another line"
sleep 2
print_warn "This is a WARNING message"
sleep 2
print_error "This is a ERROR message"
sleep 2
print_done "Test completed"

