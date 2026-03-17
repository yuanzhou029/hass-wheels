# Home Assistant Musl Wheels builder

https://peps.python.org/pep-0656/

## Platform tags

Compile utilities:

- build-base
- cmake
- git
- linux-headers
- autoconf
- automake
- cargo

### Python 3.13 / musllinux_1_2

Build with Alpine 3.22
Images: ghcr.io/home-assistant/wheels/ARCH/musllinux_1_2/cp313:VERSION

Version of system builds:

- GCC 14.2.0
- Cython 3.2.2
- numpy 2.3.3
- scikit-build 0.18.1
- cffi 2.0.0

### Python 3.14 / musllinux_1_2

Build with Alpine 3.22
Images: ghcr.io/home-assistant/wheels/ARCH/musllinux_1_2/cp314:VERSION

Version of system builds:

- GCC 14.2.0
- Cython 3.2.2
- numpy 2.3.3
- scikit-build 0.18.1
- cffi 2.0.0

## Misc

```sh

$ python3 -m builder \
    --index https://wheels.home-assistant.io \
    --requirement requirements_all.txt \
    --upload rsync \
    --remote user@server:/wheels
```

## Supported file transfer

- rsync

## Folder structure of index folder:

`/musllinux/*`

## Using as a Custom Wheels Builder

This repository has been adapted for use as a custom wheels builder. Follow these steps to set up your own instance:

1. Fork this repository to your GitHub account (e.g., `yourusername/hass-wheels`)
2. Enable GitHub Actions in your repository settings
3. Use it in your workflows:

```yaml
- name: Build wheels
  uses: yourusername/hass-wheels@main  # Replace with your fork
  with:
    abi: cp314
    tag: musllinux_1_2
    arch: amd64
    # Use local output instead of remote upload
    local-wheels-repo-path: "/tmp/output"
    wheels-host: ""
    wheels-user: ""
    requirements: "requirements.txt"
    apk: "libffi-dev;openssl-dev"
```

For more details on deploying custom Docker images, see [DOCKER_SETUP.md](DOCKER_SETUP.md).

This allows you to build Python wheels without needing access to the official Home Assistant infrastructure.
