#!/bin/bash

SERVER_PATH="ubuntu@ec2-3-249-55-33.eu-west-1.compute.amazonaws.com"
DEPLOYMENT_FOLDER="/home/ubuntu/"

chmod u+x ~/dockerkafka/src/scripts/deployfiles.sh
chmod u+x ~/dockerkafka/src/scripts/consumer.sh
chmod u+x ~/dockerkafka/src/scripts/producer.sh

# Copy the properties file
scp -i "~/.ssh/rcudd-ireland-key.pem" ~/dockerkafka/getting-started.properties ${SERVER_PATH}:${DEPLOYMENT_FOLDER}

# Copy the jar file
scp -i "~/.ssh/rcudd-ireland-key.pem" ~/dockerkafka/out/artifacts/dockerkafka_jar2/dockerkafka.jar ${SERVER_PATH}:${DEPLOYMENT_FOLDER}

# Run the jar file ready for a debug
ssh -i "~/.ssh/rcudd-ireland-key.pem" ${SERVER_PATH} "java -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005 -cp ~/confluent/dockerkafka.jar examples.ProducerExample ~/confluent/getting-started.properties > yourservice.log 2>&1 &"

# Copy the run script & move script
#scp -i "~/.ssh/rcudd-ireland-key.pem" ~/dockerkafka/src/scripts/deployfiles.sh ubuntu@ec2-3-249-55-33.eu-west-1.compute.amazonaws.com:/home/ubuntu
#scp -i "~/.ssh/rcudd-ireland-key.pem" ~/dockerkafka/src/scripts/consumer.sh ubuntu@ec2-3-249-55-33.eu-west-1.compute.amazonaws.com:/home/ubuntu
#scp -i "~/.ssh/rcudd-ireland-key.pem" ~/dockerkafka/src/scripts/producer.sh ubuntu@ec2-3-249-55-33.eu-west-1.compute.amazonaws.com:/home/ubuntu

