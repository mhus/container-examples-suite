#!/bin/sh

LIPSUM=${LIPSUM:-"paragraphs 10 -m 4 -M 6 -w 8 -W 10"}
REPEAT=${REPEAT:-1}
SLEEP=${SLEEP:-0.2}
INFINITE=${INFINITE:-false}
QUIET=${QUIET:-false}
LOG_JSON=${LOG_JSON:-false}
LOG_COLOR=${LOG_COLOR:-false}
TERMINATE_SLEEP=${TERMINATE_SLEEP:-0}

doExit() {
  echo "Exiting..."
  for i in $(seq ${TERMINATE_SLEEP} -1 1); do
    echo "Exiting in ${i} seconds..."
    sleep 1
  done
  exit 0
}

trap 'doExit' SIGTERM

lorem() {
  result=$(/lipsum.sh $LIPSUM| tr '\n' '|'|sed 's/|/\\n/g')
  if [ "${QUIET}" = "false" ]; then
    if [ "${LOG_JSON}" = "true" ]; then
      echo "{ \"message\": \"${result}\", "severity": "info", "@timestamp": "$(date +%s)"}"
    else
      if [ "${LOG_COLOR}" = "true" ]; then
        echo -e Result "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m${result}\033[0m"|sed 's/\\n/\n/g'
      else
        echo ${result}|sed 's/\\n/\n/g'
      fi
    fi
  fi
}

if [ "${INFINITE}" = "true" ]; then
  while true; do
    lorem
    sleep ${SLEEP}
  done
else
  for i in $(seq 1 1 ${REPEAT}); do
    lorem
    if [ ${i} -lt ${REPEAT} ]; then
      sleep ${SLEEP}
    fi
  done
fi