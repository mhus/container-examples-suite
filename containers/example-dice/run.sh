#!/bin/sh

SIDES=${SIDES:-6}
ROLLS=${ROLLS:-1}
SLEEP=${SLEEP:-1}
INFINITE=${INFINITE:-false}
EXIT_ON=${EXIT_ON:-0}
EXIT_MESSAGE=${EXIT_MESSAGE:-"Bye!"}
FAIL_ON=${FAIL_ON:-0}
FAIL_MESSAGE=${FAIL_MESSAGE:-"Failed!"}
FAIL_EXIT_CODE=${FAIL_EXIT_CODE:-1}
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

roll() {
  result=$((1 + RANDOM % ${SIDES}))
  if [ "${QUIET}" = "false" ]; then
    if [ "${LOG_JSON}" = "true" ]; then
      echo "{ \"message\": \"${result}\", "severity": "info", "@timestamp": "$(date +%s)"}"
    else
      if [ "${LOG_COLOR}" = "true" ]; then
        echo -e Result "\033[1;32m${result}\033[0m"
      else
        echo ${result}
      fi
    fi
  fi
  if [ ${result} -eq ${FAIL_ON} ]; then
    if [ "${FAIL_MESSAGE}" != "-" ]; then
      echo ${FAIL_MESSAGE}
    fi
    exit ${FAIL_EXIT_CODE}
  fi
  if [ ${result} -eq ${EXIT_ON} ]; then
    if [ "${EXIT_MESSAGE}" != "-" ]; then
      echo ${EXIT_MESSAGE}
    fi
    exit 0
  fi
}

if [ "${INFINITE}" = "true" ]; then
  while true; do
    roll
    sleep ${SLEEP}
  done
else
  for i in $(seq 1 1 ${ROLLS}); do
    roll
    if [ ${i} -lt ${ROLLS} ]; then
      sleep ${SLEEP}
    fi
  done
fi