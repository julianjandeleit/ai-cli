#!/bin/bash

set -ex

echo "CI: Check if command exists"
type ai-cli

# both init and upgrade are needed to successfully use ai-cli run 

#bash -x ai-cli ai-cli -c11.2 build all

echo "CI: exec init"
bash -x ai-cli init
echo "CI: exec init finished successfully"

echo "CI: start mlflow"
bash -ex ai-cli start-mlflow
echo "CI: start mlflow finished successfully"

docker container ls -a
docker logs runner-mlflow-server
sleep 1m
docker ps -a
docker logs runner-mlflow-server
wget http://server:5000
cat index.html

#echo "CI: exec run"
#echo "working directory is \"$PWD\""
#ls -al
#cd examples/basic && bash -x ./ci-tests.sh
#echo "CI: exec run finished successfully"
