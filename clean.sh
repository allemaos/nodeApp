#!/bin/sh

rm package.json
rm npm-shrinkwrap.json
rm buildstep
rm -rf node_modules

docker-machine restart default
docker-machine env
eval $(docker-machine env)

docker ps -q -a | xargs docker rm

#docker rmi $(docker images | grep "^<none>" | awk '{print $3}')
#delete all images
docker images -q | xargs docker rmi
