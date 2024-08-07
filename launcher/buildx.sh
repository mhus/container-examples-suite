#!/bin/sh

cd "$(dirname "$0")"
cd ../containers

RELEASE_TAG=latest

if [ "$IS_RELEASE" = "true" ]; then
  RELEASE_TAG=$(date '+%Y%m%d')
fi

echo "===================================================="
echo "Creating dice container"
echo "===================================================="
cd example-dice
docker buildx build --platform linux/amd64,linux/arm64 -t mhus/example-dice:$RELEASE_TAG --push . || exit 1
cd ..

echo "===================================================="
echo "Creating countdown container"
echo "===================================================="
cd example-countdown
docker buildx build --platform linux/amd64,linux/arm64 -t mhus/example-countdown:$RELEASE_TAG --push . || exit 1
cd ..

echo "===================================================="
echo "Creating bash container"
echo "===================================================="
cd example-bash
docker buildx build --platform linux/amd64,linux/arm64 -t mhus/example-bash:$RELEASE_TAG --push . || exit 1
cd ..

echo "===================================================="
echo "Creating bash root container"
echo "===================================================="
cd example-bash-root
docker buildx build --platform linux/amd64,linux/arm64 -t mhus/example-bash-root:$RELEASE_TAG --push . || exit 1
cd ..

echo "===================================================="
echo "Creating stress container"
echo "===================================================="
cd example-stress
docker buildx build --platform linux/amd64,linux/arm64 -t mhus/example-stress:$RELEASE_TAG --push . || exit 1
cd ..

echo "===================================================="
echo "Creating web container"
echo "===================================================="
cd example-web
docker buildx build --platform linux/amd64,linux/arm64 -t mhus/example-web:$RELEASE_TAG --push . || exit 1
cd ..

echo "===================================================="
echo "Creating lorem container"
echo "===================================================="
cd example-lorem
docker buildx build --platform linux/amd64,linux/arm64 -t mhus/example-lorem:$RELEASE_TAG --push . || exit 1
cd ..
