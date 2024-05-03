---
sidebar_position: 6
title: Web Example Container
---

# Web Example Container

This container is a simple example of a container that runs a web server. It uses the `nginx` web server to serve a
simple HTML page. The use case for this container is to demonstrate how to use a web server in a container.

The container is based on the `nginx` image and generates a simple HTML page at startup. The port is always set to 80.

## Environment variables

- `MESSAGE`: The message to display on the web page. (default: "Hello World")
- `COLOR`: The color of the message. (default: blue) Available colors are red, green, blue, yellow, pink, purple, orange, brown, black, white, gray, and cyan.
- `COLOR_TEXT`: The color of the text. (default: white) Available colors are red, green, blue, yellow, pink, purple, orange, brown, black, white, gray, and cyan.
- `RANDOM_COLOR`: If set to `true`, the colors will be random. (default: false) The background color will be printed in the log.

## Running with docker

```bash
docker run -it --rm -e MESSAGE="Hello World" -e COLOR=blue -p 8080:80 mhus/example-web:latest
```

## Running with kubernetes

```bash
kubectl run web --image=mhus/example-web:latest --env="MESSAGE=Hello World" --env="COLOR=blue" --port=80
```
