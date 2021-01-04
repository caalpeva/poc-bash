#!/bin/bash

SCRIPT_PATH=$(dirname $(readlink -f $0))
echo "SCRIPT PATH: ${SCRIPT_PATH}"

source "${SCRIPT_PATH}/../poc-commons/echo-utils.src"

echo_debug "This is a line"
sleep 2
echo_info "This is another line"
sleep 2
echo_warning "This is a WARNING message"
sleep 2
echo_error "This is a ERROR message"
sleep 2
echo_done "Test completed"

