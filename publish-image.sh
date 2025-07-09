VERSION=1.0.0
DOCKERHUB_USERNAME=
IMAGE_NAME=flask-app

docker login

docker build -t ${IMAGE_NAME}:${VERSION} -t ${IMAGE_NAME}:latest .

# Tag the images for Docker Hub
docker tag ${IMAGE_NAME}:${VERSION} ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${VERSION}
docker tag ${IMAGE_NAME}:latest ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:latest

# Push both tags to Docker Hub
docker push ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${VERSION}
docker push ${DOCKERHUB_USERNAME}/${IMAGE_NAME}:latest

# Verify the push
docker images | grep ${IMAGE_NAME}