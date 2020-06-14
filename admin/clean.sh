#!/bin/bash

set -u -e 

for TEMPLATE in $(find .. -name "*.template"); do
  FILE=$(echo $TEMPLATE | sed 's/.template//')
  echo "Deleting $FILE"
  rm $FILE
done
