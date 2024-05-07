---
sidebar_position: 2
title: Countdown Example Container
---

# Countdown Example Container

This example demonstrates how to create a simple countdown timer using a container. If the countdown reaches zero, 
the container will output a message and exit. The use case for this container is to demonstrate how to run a container 
for a specific duration like jobs or cron jobs.

## Environment variables

- `SLEEP`: The duration between each countdown update in seconds. (default: 1)
- `START`: The initial value of the countdown. (default: 10)
- `MESSAGE`: The message to display when the countdown reaches zero. Set to "-" to skip message. (default: "Countdown complete!")
- `QUIET`: If set to `true`, the container will not output the countdown value but the message. (default: false)
- `EXIT_CODE`: The exit code to return when the countdown reaches zero. (default: 0)'
- `LOG_JSON`: If set to `true`, the container will output the countdown value in JSON format. (default: false)
- `LOG_COLOR`: If set to `true`, the container will output the countdown value in color. Ignored if `LOG_JSON` is set. (default: false)
- `TERMINATE_SLEEP`: The duration to sleep before terminating the job. (default: 0)

## Running with docker

```bash
docker run --rm -e SLEEP=1 -e START=10 -e MESSAGE="Countdown complete" -e QUIET=false mhus/example-countdown:latest 
```

## Running with kubernetes

```bash
kubectl run countdown --image=mhus/example-countdown:latest --env="SLEEP=1" --env="START=10" --env="MESSAGE=Countdown complete" --restart=Never
```

