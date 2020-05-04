#!/bin/bash

# check if the DOCKER_HOST paramater is provided
if [ -z "$1" ]; then
  echo "Please provide docker host/ip address as parameter"
  exit 1
fi

# check if docker cli is insalled
if ! which docker &> /dev/null; then
  echo "Downloading docker cli and docker-compose cli"
  cd ~
  curl -o docker-cli.tar.gz https://download.docker.com/mac/static/stable/x86_64/docker-18.09.9.tgz && \
  tar -xzf docker-cli.tar.gz && \
  echo "export PATH=$HOME/docker:$PATH" >> ~/.bash_profile && \
  rm -rf docker-cli.tar.gz
fi

# check if DOCKER_HOST is set
if [[ -z "${DOCKER_HOST}" ]]; then
  #DOCKER_HOST is not set
  echo "Setting DOCKER_HOST to "$1
  echo "export DOCKER_HOST="$1 >> ~/.bash_profile
else
  echo "WARNING! DOCKER_HOST is already set!"
fi
