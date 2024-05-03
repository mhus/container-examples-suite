#!/bin/sh

cd "$(dirname "$0")"
cd ../containers

echo "===================================================="
echo "Creating dice container"
echo "===================================================="
cd example-dice
docker buildx build --platform linux/amd64,linux/arm64 -t mhus/example-dice:latest . || exit 1
cd ..

echo "===================================================="
echo "Creating countdown container"
echo "===================================================="
cd example-countdown
docker buildx build --platform linux/amd64,linux/arm64 -t mhus/example-countdown:latest . || exit 1
cd ..

echo "===================================================="
echo "Creating bash container"
echo "===================================================="
cd example-bash
docker buildx build --platform linux/amd64,linux/arm64 -t mhus/example-bash:latest . || exit 1
cd ..
