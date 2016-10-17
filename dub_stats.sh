#!/bin/bash

set -euo pipefail
packages=$(curl -fsS http://code.dlang.org/packages/index.json | jq -r '.[]')

echo 'pkg,total,monthly' > dub_stats.csv
for pkg in $packages; do
    curl -fsS http://code.dlang.org/api/packages/$pkg/stats | jq -r "\"$pkg,\" + (.downloads.total | tostring) + \",\" + (.downloads.monthly | tostring)" >> dub_stats.csv
done
