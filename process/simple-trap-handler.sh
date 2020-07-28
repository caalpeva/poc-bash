#!/bin/bash

#####################
##### FUNCTIONS #####
#####################

function handleSignal {
  echo "Caught signal..."
  echo "Done cleanup... quitting"
  exit 1
}

echo "Initializing... (PID = $$)"

trap handleSignal INT QUIT TERM KILL

while /bin/true
do
  sleep 3
  echo "Processing..."
done

