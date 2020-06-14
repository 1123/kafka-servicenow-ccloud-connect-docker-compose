#!/bin/bash

set -u -e 

ksql -u $KSQL_API_KEY -p $KSQL_API_SECRET $KSQL_URL
