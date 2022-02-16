#!/bin/bash
# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

# Variables
_start=1

# This accounts as the "totalState" variable for the ProgressBar function
_end=100

# Proof of concept
for number in $(seq ${_start} ${_end})
do
    sleep 0.1
    ProgressBar ${number} ${_end}
done
printf '\nFinished!\n'


#####################################################
function showProgressBar3() {
  # your real command here, instead of sleep
  sleep 7 &
  PID=$!
  i=1
  sp="/-\|"
  echo -n ' '
  while [ -d /proc/$PID ]
  do
    printf "\b${sp:i++%${#sp}:1}"
  done
}

function showProgressBar2() {
  local spin='◴◷◶◵'
  #local spin='⠁⠂⠄⡀⢀⠠⠐⠈'
  #local spin='-\|/'
  local charwidth=1
  local i=0
  for i in {1..5}; do
    local i=$(((i + $charwidth) % ${#spin}))
    printf "%s" "${spin:$i:$charwidth}"
    #echo -ne "\r${BAR:0:$i}"
    cursorBack 1
    sleep 1
  done
}

function showProgressBar() {
  local duration=${1}


    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  clean_line
}

function cursorBack() {
  echo -en "\033[$1D"
}

#BAR='####################'   # this is full bar, e.g. 20 chars
#for i in {1..20}; do
#  echo -ne "\r${BAR:0:$i}" # print $i chars of $BAR from 0 position
#sleep .5                 # wait 100ms between "frames"
