#!/bin/bash 

BANDIT_IMAGE='bandit'
BANDIT_TAG='tests'
DOCKERFILE='bandit.Dockerfile'
PWD=$(pwd)
chmod +x ./shared/run_bandit.sh

set -e

docker build -t ${BANDIT_IMAGE}:${BANDIT_TAG} -f ${DOCKERFILE} .

docker run -v ${PWD}/shared/:/bandit/app ${BANDIT_IMAGE}:${BANDIT_TAG} 

