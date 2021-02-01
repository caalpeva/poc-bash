#!/bin/bash

DIR=$(dirname $(readlink -f $0))

source "${DIR}/../includes/print-utils.src"
source "${DIR}/../includes/trace-utils.src"

directory=${DIR}/files
echo "The directory $directory contains the following files:"
files=$(ls $directory)
#IFS=$'\n'
for file in $files
do
    echo $file
    #IFS=$'\n'

    array=("PEPITO \nGRILLO" "PERICO PALOTES")
    #echo "$( IFS="|"; echo "${array[*]}" )"
done

    echo "array como un TODO con comillas"
    echo "${array[*]}"
    echo "=========="
    for item in "${array[*]}" # Entra como un solo campo string ignorando el IFS. Todos los parámetros se traten como uno solo.
    do
        echo "$item"
    done
    echo "*****************************"

    echo "array como un arroba con comillas"
    echo "${array[@]}"
    echo "=========="
    for item in "${array[@]}" # Cuando hay @ y comillas en un for, se mantiene la expresion entrecomillas para cada item del array.
    # Se recorre el array respetando el orden de las posiciones y al estar cada valor entrecomillado no entra en juego el IFS.
    do
        echo "$item"
    done
    echo "*****************************"

    echo "array como un TODO sin comillas"
    echo ${array[*]}
    echo "=========="
    for item in ${array[*]} # Entra como un flujo de string, separando items por el IFS
    do
        echo "$item"
    done
    echo "*****************************"

    echo "array como un arroba sin comillas"
    echo ${array[@]}
    echo "=========="
    IFS=:
    for item in ${array[@]} # Entra recorriento cada item pero separando el mismo por IFS
    do
        echo "$item "
    done

