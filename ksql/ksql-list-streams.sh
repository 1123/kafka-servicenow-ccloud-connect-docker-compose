#!/bin/bash

set -u -e

curl -X "POST" "$KSQL_URL/ksql" \
     -H "Accept: application/vnd.ksql.v1+json" \
     -H "Content-Type: application/vnd.ksql.v1+json; charset=utf-8" \
     -u $KSQL_API_KEY:$KSQL_API_SECRET \
     -d $'{
  "ksql": "LIST STREAMS;",
  "streamsProperties": {}
}'
