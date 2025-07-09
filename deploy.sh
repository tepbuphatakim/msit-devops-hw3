#!/bin/bash

DEFAULT_PORT=5000
DEFAULT_TAG="latest"

read -p "Enter port number (default: ${DEFAULT_PORT}): " PORT
PORT=${PORT:-$DEFAULT_PORT} # If PORT is empty use DEFAULT_PORT

read -p "Enter image tag (default: ${DEFAULT_TAG}): " TAG
TAG=${TAG:-$DEFAULT_TAG}

DOCKERHUB_USERNAME="015331741"
IMAGE_NAME="msit-devops-hw3"

# Check if port is already in use by a Docker container
EXISTING_CONTAINER_ID=$(docker ps -q --filter "publish=${PORT}")

if [ ! -z "$EXISTING_CONTAINER_ID" ]; then
    read -p "Port ${PORT} is already in use. Do you want to stop the existing container? (y/n): " STOP_CONTAINER
    if [ "$STOP_CONTAINER" = "y" ]; then
        echo "Stopping container on port ${PORT}..."
        docker stop $EXISTING_CONTAINER_ID
    else
        echo "Aborting deployment. Please choose a different port."
        exit 1
    fi
fi

echo "Pulling image ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${TAG}..."
docker pull ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${TAG}

echo "Running container on port ${PORT}..."
docker run -d -p ${PORT}:5000 ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${TAG}

echo "Container started successfully!"
