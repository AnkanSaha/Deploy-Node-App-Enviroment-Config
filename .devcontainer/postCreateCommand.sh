#!/bin/bash

sudo apt-get update -y # Update apt-get cache

# Setup Docker Containers
docker pull mongodb/mongodb-community-server:latest # Pull latest MongoDB image
docker pull redis:latest # Pull latest Redis image

# Setup MongoDB
docker run -d -p 27017:27017 --name MongoDB mongodb/mongodb-community-server # Run MongoDB container
# Setup Redis
docker run -d -p 6379:6379 --name Redis redis # Run Redis container