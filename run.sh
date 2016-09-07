#!/usr/bin/env bash

docker ps -qa |xargs docker rm -f
docker-compose build
docker-compose up -d
docker-compose scale saltminion=3
docker exec -it saltdemo_masternode_1 bash
