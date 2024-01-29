# cdc-example

https://debezium.io/documentation/reference/stable/connectors/postgresql.html

https://developer.confluent.io/courses/kafka-connect/rest-api/

https://materialize.com/blog/change-data-capture-is-having-a-moment-why/

https://redpanda-data.medium.com/using-cockroachdb-and-redpanda-for-change-data-capture-a052d47b6e0f

https://redpanda.com/blog/cockroachdb-change-data-capture-redpanda

https://redpanda.com/blog/redpanda-debezium

https://www.cockroachlabs.com/docs/stable/debezium


http://localhost:8083/connectors

http://localhost:8083/connector-plugins/

http://localhost:8083/connector-plugins/postgres-kafkaconnector/config/validate

http://localhost:8083/connectors/postgres-kafkaconnector/status

```shell
docker exec -it redpanda /bin/bash
rpk topic list

docker exec -it mysql /bin/bash
mysql -u mysqluser -p mysqlpw
use inventory;
show tables;

curl --request POST \
  --url http://localhost:8083/connectors \
  --header 'Content-Type: application/json' \
  --data '{
  "name": "inventory-connector",
  "config": {
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "tasks.max": "1",
    "database.hostname": "mysql",
    "database.port": "3306",
    "database.user": "debezium",
    "database.password": "dbz",
    "database.server.id": "184054",
    "database.server.name": "dbserver1",
    "database.include.list": "inventory",
    "database.history.kafka.bootstrap.servers": "redpanda:9092",
    "database.history.kafka.topic": "schema-changes.inventory"
  }
}'

rpk topic list

rpk topic consume dbserver1.inventory.customers

UPDATE customers SET first_name='Anne Marie' WHERE id=1004;
```
