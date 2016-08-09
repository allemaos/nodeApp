#!/bin/sh
docker-machine create --driver virtualbox dev

docker-machine start dev # start virtual machine for docker
eval "$(docker-machine env dev)" #set environment variables
export DOCKER_IP="$(docker-machine ip dev)"
# docker-machine env dev # it's helps to get environment variables

