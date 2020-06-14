set -e -u

CONNECTOR_NAME=$1
curl localhost:8083/connectors/$CONNECTOR_NAME/status
