#!/usr/bin/env bash
set -xe

docker build -t rabbitmq ./images/RabbitMQ
docker run -d --rm --env-file ./bin/.env -p 5779:5672 -p 15779:15672 --name rabbit-lib-test rabbitmq

sleep 5

node tests

docker stop rabbit-lib-test
