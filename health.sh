#!/bin/bash

EXITCODE=0

if [[ -z "${HEALTH_ENABLE}" ]]; then
  echo "HEALTH_ENABLE not check, doing nothing. UNKNOWN"
else
  if [[ -z "${HEALTH_PORT}" ]]; then
    echo "HEALTH_PORT VARIABLE not set. UNHEALTHY"
    exit 2
  fi
  if netstat -an | grep "LISTEN" | grep "${HEALTH_PORT}" > /dev/null; then
    echo "listening for connections on port ${HEALTH_PORT}. HEALTHY"
  else
    echo "not listening for connections on port ${HEALTH_PORT}. UNHEALTHY"
    EXITCODE=1
  fi
fi

exit $EXITCODE
