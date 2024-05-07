---
sidebar_position: 3
title: Dice Example Container
---

# Dice Example Container

This container is a simple example of a container that simulates rolling a dice. The container will output a random 
number. The use case for this container is to demonstrate how to run for infinite time or a specific number of times.
Jobs can fail depending on the number of the result of the last roll.

## Environment variables

- `SIDES`: The number of sides on the dice. (default: 6)
- `ROLLS`: The number of times to roll the dice. (default: 1)
- `INFINITE`: If set to `true`, the dice will roll forever. (default: false)
- `SLEEP`: The duration between each roll in seconds. (default: 1)
- `EXIT_ON`: The number that will cause the job to exit. (default: 0 - never)
- `EXIT_MESSAGE`: The message to display when the job exits. Set to "-" to skip message. (default: "Bye!")
- 'FAIL_ON': The number that will cause the job to fail. (default: 0 - never)
- 'FAIL_MESSAGE': The message to display when the job fails. Set to "-" to skip message. (default: "Failed!")
- 'FAIL_EXIT_CODE': The exit code when the job fails. (default: 1)
- `QUIET`: If set to `true`, the dice will not output the result of each roll. (default: false)
- `LOG_JSON`: If set to `true`, the dice will output the result of each roll in JSON format. (default: false)
- 'LOG_COLOR': If set to `true`, the dice will output the result of each roll in color. Ignored if `LOG_JSON` is set. (default: false)
- `TERMINATE_SLEEP`: The duration to sleep before terminating the job. (default: 0)

## Running with docker

```bash
docker run --rm -e SLEEP=1 -e ROLLS=1 -e SIDES=6 mhus/example-dice:latest 
```

## Running with kubernetes

```bash
kubectl run dice --image=mhus/example-dice:latest --env="SLEEP=1" --env="ROLLS=1" --env="SIDES=6" --restart=Never
```
