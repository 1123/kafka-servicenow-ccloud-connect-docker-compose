#!/bin/bash

set -e -u

TOPIC=$1

kafka-avro-console-consumer \
  --bootstrap-server $BOOTSTRAP_SERVERS \
  --property schema.registry.url=http://localhost:8085 \
  --consumer.config client.properties \
  --topic $TOPIC \
  --from-beginning
