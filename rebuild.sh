#!/bin/sh

./clean.sh


for i in 1 2 3 4 5 6 7
do
  echo "runing build from rebuild.sh"
  ./build.sh
done