# Docker Image Setup for Hass Wheels

## Overview

This guide explains how to build and deploy the Docker images required for the hass-wheels tool to function properly.

## Prerequisites

- Docker installed on your system
- Access to GitHub Container Registry (ghcr.io)
- Repository with package write permissions

## Building the Images

### Automated Build (Recommended)

The provided GitHub workflow (`.github/workflows/build-docker.yml`) will automatically build and push the required Docker images when you push to the main branch or create a tag.

### Manual Build

If you prefer to build manually, use the scripts in the `script/` directory:

```bash
# For a single architecture (make sure to set the variables)
BUILD_ARCH=amd64 CPYTHON_ABI=cp314 ./script/build_docker.sh

# For multi-architecture (requires buildx with multi-platform support)
./script/build_multiarch.sh
```

## Required Images

The action expects the following Docker images to be available:

- `ghcr.io/yuanzhou029/hass-wheels/amd64/musllinux_1_2/cp313:dev`
- `ghcr.io/yuanzhou029/hass-wheels/amd64/musllinux_1_2/cp314:dev`
- `ghcr.io/yuanzhou029/hass-wheels/aarch64/musllinux_1_2/cp313:dev`
- `ghcr.io/yuanzhou029/hass-wheels/aarch64/musllinux_1_2/cp314:dev`

## Using Your Custom Images

To use your custom Docker images in the workflow, specify the `wheels-registry` parameter:

```yaml
- name: Build wheels
  uses: yuanzhou029/hass-wheels@main
  with:
    abi: cp314
    tag: musllinux_1_2
    arch: amd64
    wheels-registry: "ghcr.io/yuanzhou029"  # Your custom registry
    local-wheels-repo-path: "/tmp/output"
    wheels-host: ""
    wheels-user: ""
    requirements: "requirements.txt"
```

## Deployment Steps

1. Fork or clone this repository to your GitHub account
2. Push the repository to your GitHub account (e.g., `yuanzhou029/hass-wheels`)
3. Enable GitHub Actions in your repository settings
4. The Docker images will be built automatically when you push to main
5. Use the action in your workflows with `yuanzhou029/hass-wheels@main`