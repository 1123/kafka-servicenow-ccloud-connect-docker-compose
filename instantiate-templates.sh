#!/bin/bash

set -u -e 

for TEMPLATE in *.template connectors/*.template; do
  FILE=$(echo $TEMPLATE | sed 's/.template//')
  echo "creating $FILE"
  cat $TEMPLATE |\
    sed 's;SN_INSTANCE_URL;'$SN_INSTANCE_URL';' |\
    sed 's/CC_API_KEY/'$CC_API_KEY'/' |\
    sed 's/CC_API_SECRET/'$CC_API_SECRET'/' |\
    sed 's/SN_PASSWORD/'$SN_PASSWORD'/' |\
    sed 's/BOOTSTRAP_SERVERS/'$BOOTSTRAP_SERVERS'/' > $FILE
done
