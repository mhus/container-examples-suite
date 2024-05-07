#!/bin/sh

START=${START:-10}
SLEEP=${SLEEP:-1}
MESSAGE=${MESSAGE:-"Countdown complete!"}
QUIET=${QUIET:-false}
EXIT_CODE=${EXIT_CODE:-0}
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

for i in $(seq ${START} -1 1); do
    if [ "${QUIET}" = "false" ]; then
        if [ "${LOG_JSON}" = "true" ]; then
            echo "{ \"message\": \"${i}\", "severity": "info", "@timestamp": "$(date +%s)"}"
        else
            if [ "${LOG_COLOR}" = "true" ]; then
                echo -e Countdown "\033[1;32m${i}\033[0m"
            else
                echo $i
            fi
        fi
    fi
    sleep ${SLEEP}
done
if [ "${MESSAGE}" != "-" ]; then
  echo ${MESSAGE}
fi
exit ${EXIT_CODE}
