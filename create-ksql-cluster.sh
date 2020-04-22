#!/bin/bash

set -e -u

KSQL_CLUSTER_NAME=$1
KAFKA_CLUSTER=$2

ccloud ksql app create $KSQL_CLUSTER_NAME -ksql --cluster $KAFKA_CLUSTER
