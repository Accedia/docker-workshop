#!/bin/bash

exit=0
# check if the DOCKER_HOST paramater is provided
if [ -z "$1" ]; then
  echo "Please provide docker host/ip address as parameter"
  exit=1
fi

if [ "$exit" -eq "0" ]; then

  # check if docker cli is insalled
  if ! which docker &> /dev/null; then
    echo "Downloading docker cli and docker-compose cli"
    cd ~
    wget -q -O docker-cli.tar.gz https://download.docker.com/linux/static/stable/x86_64/docker-18.09.9.tgz && \
    tar -xzf docker-cli.tar.gz && \
    mv docker/docker /usr/local/bin/ && \
    rm -rf docker-cli.tar.gz docker && \
    wget -q -O docker-compose https://github.com/docker/compose/releases/download/1.25.4/docker-compose-Linux-x86_64 && \
    chmod +x docker-compose && \
    mv docker-compose /usr/local/bin
  fi

  # check if DOCKER_HOST is set
  if [[ -z "${DOCKER_HOST}" || $2 = "force" ]]; then
    #DOCKER_HOST is not set
    echo "Setting DOCKER_HOST to "$1
    echo "export DOCKER_HOST="$1 >> ~/.bashrc
  else
    printf "WARNING! DOCKER_HOST is already set! Add force at the end of the command"
    printf "\n\nUsage:\n"
    printf "source setup-docker-linux.sh DOCKER_HOST [force]\n"
  fi

fi

source ~/.bashrc
