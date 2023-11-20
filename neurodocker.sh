#!/usr/bin/env bash

docker run --platform=linux/amd64 --rm repronim/neurodocker:latest \
    generate docker \
    --pkg-manager apt \
    --yes \
    --base-image debian:bullseye-slim \
    --fsl version=6.0.6.4 \
    --freesurfer version=7.2.0 \
    --ants version=2.4.3 \
    > Dockerfile


docker build --platform linux/amd64 -t tracula-docker-test .

