#!/bin/bash

set -e -u

kafka-console-consumer \
  --bootstrap-server $BOOTSTRAP_SERVERS \
  --consumer.config client.properties \
  --topic connect-xyz-offsets \
  --from-beginning
