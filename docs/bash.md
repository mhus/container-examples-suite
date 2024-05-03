---
sidebar_position: 4
title: Bash Example Container
---

# Bash Example Container

This example demonstrates how to create a simple container that runs a Bash script. By default the container will
print the current time and a message until the container is stopped.

## Environment variables:

- `SLEEP`: The duration to sleep in seconds between the output. (default: 10)
- `MESSAGE`: Additional message. (default: empty)

## Run with other commands

It's possible to overwrite the command and run other commands. For example, to run `ls -l`.

## Installed packages:

`bash coreutils procps util-linux findutils curl wget jq ngrep vim nano tcpdump bind-tools iproute2 iputils`

## Running with docker

```bash
# infinite loop
docker run -it --rm mhus/example-bash:latest 

# bash
docker run -it --rm mhus/example-bash:latest --

# bash and root user
docker run -it --rm --user root mhus/example-bash:latest --
```

## Running with kubernetes

```bash
# Run infinite loop
kubectl run bash --image=mhus/example-bash:latest --env="SLEEP=10" --restart=Never

# Connect to the container with bash
kubectl exec -it bash -- /bin/bash
```
