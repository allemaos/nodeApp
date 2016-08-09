#!/bin/sh
docker-machine start dev # start virtual machine for docker
docker-machine env dev # it's helps to get environment variables
eval $(docker-machine env dev) #set environment variables
