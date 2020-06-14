kafka-topics --delete --topic _confluent-command \
  --bootstrap-server $BOOTSTRAP_SERVERS \
  --command-config client.properties 
