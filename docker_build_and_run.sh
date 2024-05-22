#!/bin/bash

# grant permission on terminal to execute the script with 'chmod +x docker_build_and_run.sh'
# the following commands will download this images, create containers and execute compose

# request user confirmation before proceeding
echo -e "This script will stip and create all docker containers, images, volumes and networks needed by the project.\n Are you sure you want to continue? (yes/no): "
read confirmation

# check if the confirmation is "yes" to continue
if [ "$confirmation" != "yes" ]; then
  echo "Process aborted. No installations were carried out."
  exit 0
fi

# build image from PostgreSQL
docker build -t postgres-db-reacher -f dockerfile.postgres .

# build image from backend Node.js
docker build -t backend-reacher -f dockerfile.node .

# Execute container PostgreSQL
docker run -d --name reacher_db postgres-db-reacher

# Execute container backend Node.js
docker run -d --name back backend-reacher

# clean the terminal
clear

# up the containers Docker with Compose
docker compose up -d
