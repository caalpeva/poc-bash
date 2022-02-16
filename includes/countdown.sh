#!/bin/bash

timeInSeconds=$(( $1 - 1 )) # add minus 1

function floor () {
  local dividend=${1}
  local divisor=${2}
  local result=$(( (${dividend} - (${dividend} % ${divisor})) / ${divisor} ))
  echo ${result}
}

function countdown() {
  seconds=${1}
  hours=$( floor ${seconds} 3600 )
  seconds=$(( ${seconds} - (3600 * ${hours}) ))
  minutes=$( floor ${seconds} 60 )
  seconds=$(( ${seconds} - (60 * ${minutes}) ))
  while [ $hours -ge 0 ]; do
    while [ $minutes -ge 0 ]; do
      while [ $seconds -ge 0 ]; do
        printf "%02d:%02d:%02d\033[0K\r" $hours $minutes $seconds
        seconds=$((seconds-1))
        sleep 1
      done
      seconds=59
      minutes=$((minutes-1))
    done
    minutes=59
    hours=$((hours-1))
  done
}

countdown $timeInSeconds
