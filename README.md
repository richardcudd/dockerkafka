# dockerkafka

Ultimate (but simple) CP environment

3 brokers
Connect

And more...

Use these commands to start up Connect with quick start (see the config file for more) and also to consume from it

curl -X POST -H "Content-Type: application/json" --data @config/connector_pageviews.config http://localhost:8083/connectors

docker-compose exec connect kafka-console-consumer --topic pageviews --bootstrap-server broker:29092  --property print.key=true --max-messages 5 --from-beginning

User this command to go and get the mysql connector

wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.45/mysql-connector-java-5.1.45.jar

Use this command to install the connector

curl -X PUT \
     -H "Content-Type: application/json" \
     --data '{
               "connector.class": "io.confluent.connect.jdbc.JdbcSinkConnector",
                    "tasks.max": "1",
                    "connection.url": "jdbc:mysql://mysql:3306/db?user=user&password=password&useSSL=false",
                    "topics": "orders",
		    "topic.creation.default.partitions": 3,
                    "auto.create": "true"
          }' \
     http://localhost:8083/connectors/mysql-sink/config | jq .
