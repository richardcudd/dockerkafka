#!/bin/bash

SERVER_PATH="ubuntu@ec2-3-249-55-33.eu-west-1.compute.amazonaws.com"
DEPLOYMENT_FOLDER="/home/ubuntu/"
PEM_PATH="~/.ssh/rcudd-ireland-key.pem"

# Copy the properties file
scp -i ${PEM_PATH} ~/dockerkafka/getting-started.properties ${SERVER_PATH}:${DEPLOYMENT_FOLDER}

# Copy the jar file
scp -i ${PEM_PATH} ~/dockerkafka/out/artifacts/dockerkafka_jar2/dockerkafka.jar ${SERVER_PATH}:${DEPLOYMENT_FOLDER}

# Copy the docker compose file
scp -i ${PEM_PATH} ~/dockerkafka/docker-compose.yml ${SERVER_PATH}:${DEPLOYMENT_FOLDER}


