#!/usr/bin/env bash

set -e

echo "Building ubuntu:trusty image..."
docker build . \
    -f "test/Linux.Dockerfile" \
    --tag "dotfile:linux"
