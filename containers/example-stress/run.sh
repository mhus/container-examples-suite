#!/bin/sh

STRESS=${STRESS:-"--vm 1 --vm-bytes 128M --vm-hang 0"}
WAIT=${WAIT:-"0"}
INFINITE=${INFINITE:-"false"}
SLEEP=${SLEEP:-"1"}

echo "Sleeping for $WAIT seconds"
sleep $WAIT

while true; do
  echo "Starting stress with: $STRESS"
  stress-ng $STRESS
  if [ "$INFINITE" = "false" ]; then
    break
  fi
  echo "Sleeping for $SLEEP seconds"
  sleep $SLEEP
done
