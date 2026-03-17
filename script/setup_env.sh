#!/usr/bin/env bash

# Setup script for building hass-wheels environment
export CARGO_NET_GIT_FETCH_WITH_CLI=true
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=true
export GRPC_PYTHON_BUILD_WITH_CYTHON=true
export CI_BUILD=1
export ENABLE_HEADLESS=1
export REQUIRE_SQLALCHEMY_CEXT=1

echo "Environment variables set for wheel building"