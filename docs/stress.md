---
sidebar_position: 5
title: Stress Example Container
---

# Stress Example Container

This container is a simple example of a container that consumes resources. It uses the `stress-ng` command to consume 
CPU and memory resources. The use case for this container is to demonstrate how the orchestrator can handle a container
that consumes lots of resources.

## Environment variables

- `STRESS`: The parameters for the stress-ng command. (default: --vm 1 --vm-bytes 128M --vm-hang 0)
- `WAIT`: The duration to wait before starting to consume resources in seconds. (default: 0)
- `INFINITE`: If set to `true`, the container will run until it is stopped. (default: false)
- `SLEEP`: The duration to sleep between each iteration in seconds. (default: 1)
- 
Fore more options for the `stress-ng` command, see the [stress-ng documentation](https://wiki.ubuntu.com/Kernel/Reference/stress-ng).

## Examples for STRESS variable

Examples from the stress-ng documentation:

- Getting the CPU hot `--matrix 0 --matrix-size 64 --tz  -t 60`
- Forcing memory pressure `--brk 2 --stack 2 --bigheap 2`
- Causing More Virtual Memory: `--vm 2 --vm-bytes 2G --mmap 2 --mmap-bytes 2G --page-in`
- Generating a large interrupt load: `--timer 32 --timer-freq 1000000`
- Generating major page faults: `--fault 0 --perf -t 1m`

## Running with docker

```bash
docker run -it --rm -e STRESS="--vm 1 --vm-bytes 128M --vm-hang 0" -e WAIT=2 -e INFINITE=true mhus/example-stress:latest
```

## Running with kubernetes

```bash
kubectl run stress --image=mhus/example-stress:latest --env="STRESS=--vm 1 --vm-bytes 128M --vm-hang 0" --env="WAIT=2" --env="INFINITE=true"
```
