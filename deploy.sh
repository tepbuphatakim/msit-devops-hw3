#!/bin/bash

DEFAULT_PORT=5000
DEFAULT_TAG="latest"

read -p "Enter port number (default: ${DEFAULT_PORT}): " PORT
PORT=${PORT:-$DEFAULT_PORT} # If PORT is empty use DEFAULT_PORT

read -p "Enter image tag (default: ${DEFAULT_TAG}): " TAG
TAG=${TAG:-$DEFAULT_TAG}

DOCKERHUB_USERNAME="015331741"
IMAGE_NAME="msit-devops-hw3"

echo "Pulling image ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${TAG}..."
docker pull ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${TAG}

echo "Running container on port ${PORT}..."
docker run -d -p ${PORT}:5000 ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${TAG}

echo "Container started successfully!"
