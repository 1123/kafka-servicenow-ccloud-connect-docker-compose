#!/bin/bash

set -u -e 

for TEMPLATE in *.template connectors/*.template; do
  FILE=$(echo $TEMPLATE | sed 's/.template//')
  echo "Deleting $FILE"
  rm $FILE
done
