#!/bin/bash
set -eo pipefail
JENKINS=${1-http://localhost:8080}
curl() { command curl -fsSL "$@"; }

JOBS=$(curl ${JENKINS}/api/json | jq -r '.jobs | .[] | .name')

for job in ${JOBS}; do
    echo "Backup $job.xml"
    curl ${JENKINS}/job/$job/config.xml > $job.xml
done
