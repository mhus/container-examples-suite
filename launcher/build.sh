#!/bin/sh

cd "$(dirname "$0")"
cd ../containers

echo "===================================================="
echo "Creating dice container"
echo "===================================================="
cd example-dice
docker build -t mhus/example-dice:latest . || exit 1
cd ..

echo "===================================================="
echo "Creating countdown container"
echo "===================================================="
cd example-countdown
docker build -t mhus/example-countdown:latest . || exit 1
cd ..

echo "===================================================="
echo "Creating bash container"
echo "===================================================="
cd example-bash
docker build -t mhus/example-bash:latest . || exit 1
cd ..

echo "===================================================="
echo "Creating stress container"
echo "===================================================="
cd example-stress
docker build -t mhus/example-stress:latest . || exit 1
cd ..

echo "===================================================="
echo "Creating web container"
echo "===================================================="
cd example-web
docker build -t mhus/example-web:latest . || exit 1
cd ..

echo "===================================================="
echo "Creating lorem container"
echo "===================================================="
cd example-lorem
docker build -t mhus/example-lorem:latest . || exit 1
cd ..

echo "===================================================="
echo "Creating events container"
echo "===================================================="
cd example-events
docker build -t mhus/example-events:latest . || exit 1
cd ..
