#!/usr/bin/env bash
set -e

# Script to build Docker images for different architectures

BUILD_FROM=${BUILD_FROM:-ghcr.io/home-assistant/musllinux-1.2-base:latest}
BUILD_ARCH=${BUILD_ARCH:-amd64}
CPYTHON_ABI=${CPYTHON_ABI:-cp314}

echo "Building Docker image for $BUILD_ARCH with $CPYTHON_ABI"
echo "Using base image: $BUILD_FROM"

docker build \
  --build-arg BUILD_FROM="$BUILD_FROM" \
  --build-arg BUILD_ARCH="$BUILD_ARCH" \
  --build-arg CPYTHON_ABI="$CPYTHON_ABI" \
  -t "ghcr.io/$GITHUB_REPOSITORY/$BUILD_ARCH/musllinux_1_2/$CPYTHON_ABI:dev" \
  .

echo "Docker image built successfully"