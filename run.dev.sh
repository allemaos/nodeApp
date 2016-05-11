#!/bin/sh
echo "\n-----------------------------"
echo "docker-compose up [development]"
echo "-----------------------------\n"

docker-compose -f docker-compose.dev.yml up
