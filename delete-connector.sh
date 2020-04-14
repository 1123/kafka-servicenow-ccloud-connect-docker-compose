set -u -e

CONNECTOR_NAME=$1
curl \
  -X DELETE \
  -H "Content-Type: application/json" \
  http://localhost:8083/connectors/${CONNECTOR_NAME}

