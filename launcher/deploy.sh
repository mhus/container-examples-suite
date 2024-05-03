#!/bin/sh

cd "$(dirname "$0")"
cd ../containers

if [ ! -z "$DOCKER_USERNAME" ]; then
  echo "Login to docker registry"
  REGISTRY_URL="https://index.docker.io/v1/"
  docker login "$REGISTRY_URL" -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"
fi

echo "===================================================="
echo "Push dice container"
echo "===================================================="
cd example-dice
docker push mhus/example-dice:latest || exit 1
if [ ! -z "$RELEASE_VERSION" ]; then
  docker tag mhus/example-dice:latest mhus/example-dice:$RELEASE_VERSION || exit 1
  docker push mhus/example-dice:$RELEASE_VERSION || exit 1
fi
cd ..

echo "===================================================="
echo "Push countdown container"
echo "===================================================="
cd example-countdown
docker push mhus/example-countdown:latest || exit 1
if [ ! -z "$RELEASE_VERSION" ]; then
  docker tag mhus/example-countdown:latest mhus/example-countdown:$RELEASE_VERSION || exit 1
  docker push mhus/example-countdown:$RELEASE_VERSION || exit 1
fi
cd ..

echo "===================================================="
echo "Push bash container"
echo "===================================================="
cd example-bash
docker push mhus/example-bash:latest || exit 1
if [ ! -z "$RELEASE_VERSION" ]; then
  docker tag mhus/example-bash:latest mhus/example-bash:$RELEASE_VERSION || exit 1
  docker push mhus/example-bash:$RELEASE_VERSION || exit 1
fi
cd ..
