#!/bin/bash 

BANDIT_IMAGE='bandit'
BANDIT_TAG='tests'
DOCKERFILE='bandit.Dockerfile'


set -e

docker build -t ${BANDIT_IMAGE}:${BANDIT_TAG} -f ${DOCKERFILE} .

docker run -v ./shared/:/bandit/app ${BANDIT_IMAGE}:${BANDIT_TAG} 