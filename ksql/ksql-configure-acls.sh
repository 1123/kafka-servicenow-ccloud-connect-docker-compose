#!/bin/bash

set -e -u

KSQL_CLUSTER_ID=$1

ccloud ksql app configure-acls $KSQL_CLUSTER_ID
