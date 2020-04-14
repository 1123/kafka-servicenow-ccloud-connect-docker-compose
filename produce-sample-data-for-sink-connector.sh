kafka-avro-console-producer \
  --broker-list $BOOTSTRAP_SERVERS \
  --property schema.registry.url=http://localhost:8085 \
  --producer.config client.properties \
  --topic test_table \
  --property value.schema='{"type":"record","name":"myrecord","fields":[{"name":"u_name","type":"string"},
{"name":"u_price", "type": "float"}, {"name":"u_quantity", "type": "int"}]}'
