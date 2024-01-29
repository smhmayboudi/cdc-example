#!/bin/sh

set -Eefuvx

curl \
  --data @./.docker/debezium-connect/kafka-topic.json \
  --header 'Content-Type: application/json' \
  --request POST \
  --url http://localhost:8083/connectors
