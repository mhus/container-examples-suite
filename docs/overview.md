---
sidebar_position: 1
title: Container Examples Suite
---

# Container Examples Suite

This suite contains a collection of simple containers to use as examples for running containers in docker and kubernetes. 
Each container demonstrates a different concept or use case.

## Containers

The containers are based on the latest `alpine` image and are written in `bash`. The containers are designed to be 
simple but useful. They are created for multiple architectures (linux/amd64 and linux/arm64) and are available 
on [Docker Hub](https://hub.docker.com/u/mhus).

All containers run with user id 1000. The containers are designed to run as non-root users.

## Releases and Snapshots

The current snapshot is available as tag `latest` and the releases are tagged with the version number. Releases should
never change and are immutable. Snapshots can be updated and are not immutable. The release tags are the date of 
creation.
