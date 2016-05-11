#!/bin/sh
echo "\n-----------------------------"
echo "docker-compose up [production]"
echo "-----------------------------\n"

docker-compose -f docker-compose.prod.yml up
