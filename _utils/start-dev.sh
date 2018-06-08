#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export NODE_ENV=dev

DOCKER_NETWORK="$(docker network ls | grep news-network || true)"
if [ "${DOCKER_NETWORK}" == "" ]; then
  docker network create -d overlay news-network
fi

DOCKER_NETWORK="$(docker network ls | grep webproxy-network || true)"
if [ "${DOCKER_NETWORK}" == "" ]; then
  docker network create -d overlay webproxy-network
fi

cd ${DIR}/../proxy
npm run packaging:init
npm run packaging:prepare
npm run packaging:image-build dev
npm run packaging:image-push dev
npm run packaging:service-deploy dev

cd ${DIR}/../tensorflow
npm run packaging:init
npm run packaging:prepare
npm run packaging:image-build dev
npm run packaging:image-push dev
npm run packaging:service-deploy dev

# cd ../server
# npm install
# npm run dev:docker
