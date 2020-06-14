#!/bin/bash

set -u -e 

for TEMPLATE in *.template connectors/*.template; do
  FILE=$(echo $TEMPLATE | sed 's/.template//')
  echo "creating $FILE"
  cat $TEMPLATE |\
    sed 's;SN_INSTANCE_URL;'$SN_INSTANCE_URL';' |\
    sed 's;CC_API_KEY;'${CC_API_KEY}';' |\
    sed 's;CC_API_SECRET;'$CC_API_SECRET';' |\
    sed 's/SN_PASSWORD/'$SN_PASSWORD'/' |\
    sed 's;SCHEMA_REGISTRY_URL;'$SCHEMA_REGISTRY_URL';' |\
    sed 's/SCHEMA_REGISTRY_KEY/'$SCHEMA_REGISTRY_KEY'/' |\
    sed 's/SCHEMA_REGISTRY_SECRET/'$SCHEMA_REGISTRY_SECRET'/' |\
    sed 's/BOOTSTRAP_SERVERS/'$BOOTSTRAP_SERVERS'/' > $FILE
done
