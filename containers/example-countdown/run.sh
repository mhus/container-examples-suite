#!/bin/sh

START=${START:-10}
SLEEP=${SLEEP:-1}
MESSAGE=${MESSAGE:-"Countdown complete!"}
QUIET=${QUIET:-false}
EXIT_CODE=${EXIT_CODE:-0}

for i in $(seq ${START} -1 1); do
    if [ "${QUIET}" = "false" ]; then
      echo $i
    fi
    sleep ${SLEEP}
done
if [ "${MESSAGE}" != "-" ]; then
  echo ${MESSAGE}
fi
exit ${EXIT_CODE}
