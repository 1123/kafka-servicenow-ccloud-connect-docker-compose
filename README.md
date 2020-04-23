#### Confluent ServiceNow Source and Sink Connectors with Confluent Cloud Enterprise

This repository is an example for connecting ServiceNow with Confluent Cloud Enterprise using the supported Source and Sink connectors for ServiceNow. 
The setup has been tested with a current hosted ServiceNow developer instance. 
The demo follows rather closely the instructions on:

* https://docs.confluent.io/current/connect/kafka-connect-servicenow/source-connector/index.html
* https://docs.confluent.io/current/connect/kafka-connect-servicenow/sink-connector/index.html

Therefore it is a good idea to read those instructions prior to running this demo. 

### Prerequisites

* A Confluent Cloud Account and api keys for connecting to Kafka and Schema Registry on Confluent Cloud
* A hosted KSQL cluster on Confluent Cloud
* A ServiceNow developer instance up and running
* docker
* docker-compose
* access to the internet for downloading of docker images
* downloaded `confluentinc-kafka-connect-servicenow` version 1.1.3 and extracted in the `service-now-connector` directory 

### Running the demo

* copy the file `envs/template.env` to `envs/development.env`, and supply your credentials for Confluent Cloud, as well as to your service now developer instance in this file. 
* source the file: `source envs/develpoment.env`, and make sure the environment variables were loaded. 
* create the configuration files by running the corresponding script: `instantiate-templates.sh`
* start the connector container by running `docker-compose up -d`
* watch the logs of the containers and make sure there are no errors: e.g. `docker-compose logs -f connect`. 
* once connect has started up, create the sample connectors: `./create-connector.sh connectors/sn-source-u_test_table-json.json`. 
  Service now developer instances come with some prepopulated sample data. 
  There are source connector sample files for different tables and for avro as well as json format. 
  Make sure the table referenced in the source connector configuration file exists in your service now instance. 
* create a service now table called `test_table` as described in the connector documentation: https://docs.confluent.io/current/connect/kafka-connect-servicenow/sink-connector/index.html#quick-start 
* create the sink connector: `./create-sink-connector.sh`.
* produce some data to Confluent Cloud as described in https://docs.confluent.io/current/connect/kafka-connect-servicenow/sink-connector/index.html#quick-start.
* Use the service now table API (you can use the ServiceNow Api explorer) to check that the data got inserted in ServiceNow. 
* Use the ksql-cli.sh script to connect to your service-now instance. This requires the environment variables `KSQL_URL`, `KSQL_API_KEY`, and `KSQL_API_SECRET` to be set. 
* Create a stream for the imported request items as shown in `create-request-item-stream.sh`.
* Start stream processing from the beginning of the log: `SET 'auto.offset.reset'='earliest';`
* Create a projected stream that shows only columns with non-null data: `CREATE stream RI_PROJECTED as select URGENCY,APPROVAL,QUANTITY,BILLABLE,CAT_ITEM,STAGE from requestitems;`
* Have a look at the data: `SELECT * from RI_PROJECTED;`

