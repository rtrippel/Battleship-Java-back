#!/bin/bash

docker-compose -f docker/docker-compose.yml down
docker-compose --env-file .env -f docker/docker-compose.yml up -d
