#!/bin/bash

IMAGE_NAME="nestjs-app-1"
REGISTRY="taniagreen4"
DOCKERFILE_PATH="."
BUILD_CONTEXT="."

echo "Building Docker image..."
docker build -t "$IMAGE_NAME" "$BUILD_CONTEXT"

echo "Tagging Docker image with additional tags..."
docker tag "$REGISTRY/$IMAGE_NAME:latest" "$REGISTRY/$IMAGE_NAME:v1.0"
docker tag "$REGISTRY/$IMAGE_NAME:latest" "$REGISTRY/$IMAGE_NAME:stable"

echo "Pushing Docker image to Docker Hub..."
docker push "$REGISTRY/$IMAGE_NAME:v1.0"
docker push "$REGISTRY/$IMAGE_NAME:stable"

echo "Docker image successfully built and pushed!"