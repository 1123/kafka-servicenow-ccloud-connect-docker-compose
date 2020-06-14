#!/bin/bash

set -u -e

TABLE=$1

curl -u admin:$SN_PASSWORD "$SN_INSTANCE_URL/api/now/table/$TABLE?sysparm_limit=10" \
  --request GET \
  --header "Accept:application/json" 



