#!/bin/bash

# Copy the properties file
scp -i "~/.ssh/rcudd-ireland-key.pem" ~/dockerkafka/getting-started.properties ubuntu@ec2-3-249-55-33.eu-west-1.compute.amazonaws.com:/home/ubuntu/confluent

# Copy the jar file
scp -i "~/.ssh/rcudd-ireland-key.pem" ~/dockerkafka/out/artifacts/dockerkafka_jar2/dockerkafka.jar ubuntu@ec2-3-249-55-33.eu-west-1.compute.amazonaws.com:/home/ubuntu/confluent
