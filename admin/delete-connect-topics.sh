for topic in connect-xyz-configs connect-xyz-offsets connect-xyz-status; do
  kafka-topics --delete --topic $topic \
    --bootstrap-server $BOOTSTRAP_SERVERS \
    --command-config client.properties 
done
