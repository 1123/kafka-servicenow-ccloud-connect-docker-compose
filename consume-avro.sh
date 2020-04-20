#!/bin/bash

set -e -u

TOPIC=$1

kafka-avro-console-consumer \
  --bootstrap-server $BOOTSTRAP_SERVERS \
  --property schema.registry.url=$SCHEMA_REGISTRY_URL \
  --property basic.auth.credentials.source=USER_INFO \
  --property schema.registry.basic.auth.user.info=$SCHEMA_REGISTRY_KEY:$SCHEMA_REGISTRY_SECRET \
  --consumer.config client.properties \
  --topic $TOPIC \
  --from-beginning
