#!/bin/bash

set -e -u

KSQL_CLUSTER_ID=$1
ccloud api-key create --resource $KSQL_CLUSTER_ID
