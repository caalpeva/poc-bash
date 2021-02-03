#!/bin/bash

DIR=$(dirname $(readlink -f $0))

source "${DIR}/../includes/print-utils.src"
source "${DIR}/../includes/trace-utils.src"

function checkParameters {
    xtrace off
    echo "Parameters: $#"
    for param in "$@"
    do
        echo $param
    done
}

print_info "Checking arguments passed in CLI ..."
#echo "$0 $*" # $* Para referirse a todos los parámetros
echo -n "$0" # Mantiene el nombre del script
for arg in "$@"
do
    echo -n " \"$arg\""
done
echo
echo "Arguments: $#"

print_info "Passing CLI arguments to function ..."
xtrace on
checkParameters "$@"

print_info "Shift arguments to the left. Passing arguments to function ..."
shift
xtrace on
checkParameters "$@"

print_info "Passing parameters to function ..."
xtrace on
checkParameters 1 23 45 $0

print_info "Passing strings with space to function ..."
enable=true
xtrace on
checkParameters "This is a parameter" "This is another one" $enable

print_done "Poc completed successfully"