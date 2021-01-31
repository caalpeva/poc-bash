#!/bin/bash

DIR=$(dirname $(readlink -f $0))

source "${DIR}/../includes/print-utils.src"
source "${DIR}/../includes/trace-utils.src"

readonly DEFAULT_COLOR="Blue"

function printColorValue {
    echo -e "+ echo \${color}"
    echo "${color}"
}

function existsColor {
    if [ ${color:+1} ]
    then
        echo "Variable \"color\" exists"
    else 
        echo "variable \"color\" not exist"
    fi
}

function unsetColor {    
    print_info "Unset variable"
    xtrace on
    unset color
    xtrace off
    printColorValue
}

print_info "A simple variable assignment"
xtrace on
color="Red"
xtrace off
printColorValue

print_info "if \${color} is not set use default \"${DEFAULT_COLOR}\""
echo -e "+ echo \${color:-${DEFAULT_COLOR}}"
echo "${color:-${DEFAULT_COLOR}}"
printColorValue

existsColor
unsetColor
existsColor

print_info "if \${color} is not set use default \"${DEFAULT_COLOR}\""
echo -e "+ echo \${color:-${DEFAULT_COLOR}}"
echo "${color:-${DEFAULT_COLOR}}"
printColorValue
existsColor

print_info "if \${color} unset, set color to default \"${DEFAULT_COLOR}\""
echo -e "+ echo \${color:=${DEFAULT_COLOR}}"
echo "${color:=${DEFAULT_COLOR}}"
printColorValue

print_info "A new simple variable assignment"
xtrace on
color="Green"
xtrace off
printColorValue

print_info "if \${color} unset, set color to default \"${DEFAULT_COLOR}\""
echo -e "+ echo \${color:=${DEFAULT_COLOR}}"
echo "${color:=${DEFAULT_COLOR}}"
printColorValue

print_info "Use the content from position N \${color:N}"
index=2
echo -e "+ echo \${color:=${index}}"
echo "${color:${index}}"

print_info "Show some environment variables"
echo -e "+ echo \${HOME}"
echo "${HOME}"
echo -e "+ echo \${PATH}"
echo "${PATH}"
echo -e "+ echo \${PWD}"
echo "${PWD}"

print_done "Poc completed sucessfully"
