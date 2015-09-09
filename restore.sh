#!/bin/bash
set -eo pipefail
JENKINS=${1-http://localhost:8080}
curl() { command curl -fsSL "$@"; }

for job in $(ls *.xml); do
    name=${job%.*}
    echo "Restore $name job"
    curl -X POST ${JENKINS}/job/$name/doDelete
    curl -X POST ${JENKINS}/createItem?name=${job%.*} -H 'Content-Type: text/xml' --data-binary @$job
done
