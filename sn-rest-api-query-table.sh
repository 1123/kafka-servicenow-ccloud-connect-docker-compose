#!/bin/bash

set -u -e

TABLE=$1

curl "https://admin:$SN_PASSWORD@dev58319.service-now.com/api/now/table/$TABLE?sysparm_limit=10" \
  --request GET \
  --header "Accept:application/json" 



