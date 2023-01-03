# dockerkafka

Ultimate (but simple) CP environment

3 brokers
Connect

And more...

Use these commands to start up Connect with quick start (see the config file for more) and also to consume from it

curl -X POST -H "Content-Type: application/json" --data @config/connector_pageviews.config http://localhost:8083/connectors

docker-compose exec connect kafka-console-consumer --topic pageviews --bootstrap-server broker:29092  --property print.key=true --max-messages 5 --from-beginning
