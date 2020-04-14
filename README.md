#### Confluent ServiceNow Source and Sink Connectors with Confluent Cloud Enterprise

This repository is an example for connecting ServiceNow with Confluent Cloud Enterprise using the supported Source and Sink connectors for ServiceNow. 
The setup has been tested with a current hosted ServiceNow developer instance. 
The demo follows rather closely the instructions on:

* https://docs.confluent.io/current/connect/kafka-connect-servicenow/source-connector/index.html
* https://docs.confluent.io/current/connect/kafka-connect-servicenow/sink-connector/index.html

Therefore it is a good idea to read those instructions prior to running this demo. 

### Prerequisites

* A Confluent Cloud Account
* A ServiceNow developer instance up and running
* docker
* docker-compose
* access to the internet for downloading of docker images
* downloaded `confluentinc-kafka-connect-servicenow` version 1.1.2 and extracted in the `service-now-connector` directory 

### Running the demo

* copy the file `env.template` to `env.development`, and supply your credentials for Confluent Cloud, as well as to your service now developer instance in this file. 
* source the file: `source env.develpoment`, and make sure the environment variables were loaded. 
* create the configuration files by running the corresponding script: `instantiate-templates.sh`
* start the connector and schema-registry containers by running `docker-compose up -d`
* watch the logs of the containers and make sure there are no errors: e.g. `docker-compose logs -f connect`. 
* once connect has started up, create one of the sample connectors: `./create-connector.sh connectors/sn-source-u_test_table-json.json`. 
  There are source connector sample files for different tables and for avro as well as json format. 
  Make sure the table referenced in the source connector configuration file exists in your service now instance. 
  Service now developer instances come with some prepopulated sample data. 
* create a service now table called `test_table` as described in the connector documentation: https://docs.confluent.io/current/connect/kafka-connect-servicenow/sink-connector/index.html#quick-start 
* create the sink connector: `./create-sink-connector.sh`.
* produce some data to Confluent Cloud as described in https://docs.confluent.io/current/connect/kafka-connect-servicenow/sink-connector/index.html#quick-start.
* Use the service now table API (you can use the ServiceNow Api explorer) to check that the data got inserted in ServiceNow. 

