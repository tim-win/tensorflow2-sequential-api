#!/bin/bash
set -exuo pipefail
IFS=$'\n\t'

NAME="tf2_test"
set +eo pipefail
CURRENT=$(docker ps | grep "$NAME" | awk '{ print $1 }')
docker stop "$NAME"; docker rm "$NAME"; echo 'no docker container to remove'
set -eo pipefail

docker build -t tft:test .

docker run \
	-d \
	--runtime=nvidia \
	-p 8080:8080 \
	-v $(pwd)/../text_generation_data/training_checkpoints/:/opt/text_generation_data/training_checkpoints/ \
	-v $(pwd)/logs/:/opt/workspace/logs \
	--name "$NAME" \
	test:latest $@
