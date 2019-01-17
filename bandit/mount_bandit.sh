#!/bin/bash 

BANDIT_IMAGE='bandit'
BANDIT_TAG='tests'
DOCKERFILE_DIR='bandit'


set -e

docker build -t ${BANDIT_IMAGE}:${BANDIT_TAG} ${DOCKERFILE_DIR}

docker run -rm -v ${BANDIT_IMAGE}:${BANDIT_TAG} 