#!/bin/bash
#read -p "Enter Build Version:" $build_version 

# Navigate to the project directory
# cd /root/app/reactjs-build/

# Build the Docker image
docker build -t priyeshshinav/private-prod-guvi:latest -t priyeshshinav/private-prod-guvi:$1 .

# Log in to Docker Hub
#docker login -u priyeshshinav

# Tag the Docker image
 # docker tag priyeshshinav/public-dev-guvi:$1 priyeshshinav/public-dev-guvi:$1


# Push the Docker image to Docker Hub
# docker push priyeshshinav/public-dev-guvi:$1
