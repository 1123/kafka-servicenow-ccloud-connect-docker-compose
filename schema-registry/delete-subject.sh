#!/bin/bash

set -u 
set -e

SUBJECT=$1

curl \
  -X DELETE \
  -u $SCHEMA_REGISTRY_KEY:$SCHEMA_REGISTRY_SECRET \
  $SCHEMA_REGISTRY_URL/subjects/$SUBJECT
