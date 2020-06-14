#!/bin/bash

set -e -u

rm -r service-now-connector
mkdir service-now-connector

confluent-hub install confluentinc/kafka-connect-servicenow:latest \
  --component-dir service-now-connector \
  --no-prompt
