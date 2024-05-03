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

roll() {
  result=$((1 + RANDOM % ${SIDES}))
  if [ "${QUIET}" = "false" ]; then
    echo ${result}
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