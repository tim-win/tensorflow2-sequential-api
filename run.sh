#!/bin/bash
set -exuo pipefail
IFS=$'\n\t'

NAME="tf2_test"
IMG_NAME="tft"
TAG="test"
IMG="${IMG_NAME}:${TAG}"
set +eo pipefail
CURRENT=$(docker ps | grep "$NAME" | awk '{ print $1 }')
docker stop "$NAME"; docker rm "$NAME"; echo 'no docker container to remove'
set -eo pipefail

docker build -t "${IMG}" .

docker run \
	--runtime=nvidia \
	-p 8080:8080 \
	-v $(pwd)/logs/:/opt/workspace/logs \
	--name "$NAME" \
	"${IMG}" $@
