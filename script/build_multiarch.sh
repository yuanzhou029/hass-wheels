#!/usr/bin/env bash
set -e

# Script to build multi-architecture Docker images

REGISTRY="ghcr.io"
REPO="yuanzhou029/hass-wheels"

echo "Building multi-architecture Docker images..."

# Build for all architectures
docker buildx build \
  --platform linux/amd64,linux/arm64 \
  --build-arg BUILD_FROM="ghcr.io/home-assistant/musllinux-1.2-base:latest" \
  --build-arg BUILD_ARCH="amd64" \
  --build-arg CPYTHON_ABI="cp314" \
  -t "$REGISTRY/$REPO/amd64/musllinux_1_2/cp314:dev" \
  -t "$REGISTRY/$REPO/aarch64/musllinux_1_2/cp314:dev" \
  --push \
  .

echo "Multi-architecture Docker images pushed successfully"