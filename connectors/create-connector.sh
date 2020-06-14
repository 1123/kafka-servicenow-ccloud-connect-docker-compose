set -e -u

FILE=$1

curl \
  -X POST \
  -H "Content-Type: application/json" \
  --data @${FILE} http://localhost:8083/connectors

